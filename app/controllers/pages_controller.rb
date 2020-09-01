# frozen_string_literal: true

class PagesController < ActionController::Base
  layout 'application'
  include ApplicationHelper

  def home; end

  def about; end
end
