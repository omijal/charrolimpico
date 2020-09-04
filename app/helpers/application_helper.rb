# frozen_string_literal: true

module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    email = user.email.downcase
    hash = Digest::MD5.hexdigest(email)
    url = "https://www.gravatar.com/avatar/#{hash}?size=#{options[:size]}"
    image_tag(url, alt: user.username, class: options[:class])
  end

  def current_user
    @current_user ||= SessionsController::Token.parse(session[:jwt])&.user
  end

  def logged_in?
    !!current_user
  end

  def require_login
    return if logged_in?

    flash[:alert] = 'You must log in first to perform this action'
    redirect_to(login_path)
  end

  def require_admin(domain)
    return if admin?

    flash[:alert] = 'You are not allowed to perform this action'
    redirect_to(domain)
  end

  def require_user(user, domain)
    return if user == current_user

    flash[:alert] = 'You are not allowed to perform this action'
    redirect_to(domain)
  end

  def admin?
    true
  end
end
