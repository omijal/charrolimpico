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
  end
end
