# frozen_string_literal: true

class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :course
end
