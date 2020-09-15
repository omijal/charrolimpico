# frozen_string_literal: true

class BasicCatalogController < ActionController::Base
  layout 'application'

  def new
    @object = model.new
  end

  def show; end

  def index
    @objects = model.paginate(page: params[:page], per_page: 3)
  end

  def create
    @object = model.new(build_params)
    if @object.save
      flash[:success] = "Tu registro fue satisfactorio. !Bienvenido #{@object.username}!"
      redirect_to(login_path)
    else
      render('new')
    end
  end

  def edit; end

  def update
    if @object.update(build_params)
      flash[:notice] = 'Updated correctly'
      redirect_to(@object)
    else
      render('edit')
    end
  end

  private

  def find_object
    @object = model.find(params[:id])
  end

  def build_params
    params.require(:user).permit(:username, :email, :password)
  end

  def check_user
    require_user(@object, root_path)
  end
end
