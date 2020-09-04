# frozen_string_literal: true

class SessionsController < ActionController::Base
  layout 'application'

  include ApplicationHelper

  class Token
    attr_reader :user

    def initialize(user)
      @user = user
    end

    def jwt
      JWT.encode(payload, rsa_private, 'RS512')
    end

    def self.parse(token)
      payload, = JWT.decode(token, nil, false, { algorithm: 'RS512' })
      new(User.find(payload['user']['id']))
    rescue ActiveRecord::RecordNotFound
      nil
    rescue StandardError => e
      raise unless ['Nil JSON web token'].include?(e.message)
      nil
    end

    private

    def payload
      {
        user: @user.attributes.except('password_digest'),
        created_at: Time.now,
        roles: []
      }
    end

    def rsa_private
      @rsa_private ||= OpenSSL::PKey::RSA.new(File.read('./storage/jwt.pem'))
    end

    def rsa_public
      rsa_private.public_key
    end
  end

  def new
    redirect_to('/dashboard') if logged_in?
  end

  def find_user(username)
    User.find_by(email: username) || User.find_by(username: username)
  end

  def authenticate?(credentials)
    user = find_user(credentials[:username])
    user&.authenticate(credentials[:password]) && user
  end

  def build_session(user)
    session[:jwt] = Token.new(user).jwt
  end

  def create
    if (user = authenticate?(params[:session]))
      build_session(user)
      flash[:notice] = "Bienvenido #{user.username}. ¿Qué vamos a hacer esta noche?"
      redirect_to('/dashboard')
    else
      flash.now[:alert] = 'Invalid Credentials'
      render('new')
    end
  end

  def destroy
    session[:jwt] = nil
    flash.now[:alert] = '¡Adiós!'
    render('new')
  end
end
