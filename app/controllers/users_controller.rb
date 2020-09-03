# frozen_string_literal: true

class UsersController < ActionController::Base
  layout 'application'

  before_action :find_user, only: %i[show edit update destroy]
  before_action :check_user, only: %i[edit update]

  include ApplicationHelper

  def new
    @user = User.new
  end

  def show; end

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def create
    @user = User.new(build_params)
    if @user.save
      flash[:notice] = "Tu registro fue satisfactorio. !Bienvenido #{@user.username}!"
      redirect_to(login_path)
    else
      render('new')
    end
  end

  def edit; end

  def update
    if @user.update(build_params)
      flash[:notice] = 'Updated correctly'
      redirect_to(@user)
    else
      render('edit')
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def build_params
    params.require(:user).permit(:username, :email, :password)
  end

  def check_user
    require_user(@user, root_path)
  end
end
