# frozen_string_literal: true

class Enrollment < ApplicationRecord
  belongs_to :career
  belongs_to :user
  belongs_to :roles
end
