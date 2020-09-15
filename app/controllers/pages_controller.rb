# frozen_string_literal: true

class PagesController < ActionController::Base
  layout 'application'
  include ApplicationHelper

  def home
    redirect_to '/dashboard' if logged_in?
  end

  def about; end

  def dashboard
    require_login
    @navoptions = 'dashboards/nav'
    @user = current_user
    @tickets = current_user.homeworks.collect(&:task)
  end

  def admin
    require_admin

    @catalogs = %w[organizations categories courses problems careers tasks]
  end
end
