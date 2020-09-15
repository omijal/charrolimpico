# frozen_string_literal: true

require_relative 'basic_catalog_controller'

class UsersController < BasicCatalogController
  before_action :find_object, only: %i[show edit update destroy]
  before_action :check_user, only: %i[edit update]

  include ApplicationHelper

  def model
    User
  end

  def check_user
    require_user(@object, root_path)
  end
end
