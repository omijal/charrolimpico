# frozen_string_literal: true

class Role < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 32 }
  has_many :enrollments
  has_many :users, through: :enrollments
end
