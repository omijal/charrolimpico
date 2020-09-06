# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  belongs_to :role
end
