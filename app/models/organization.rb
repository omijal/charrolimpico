# frozen_string_literal: true

class Organization < ApplicationRecord
  validates :shortname, presence: true, length: { minimum: 3, maximum: 8 }
  validates :fullname, presence: true, length: { minimum: 3, maximum: 128 }

  has_many :careers
  has_many :categories
  has_many :problems
  has_many :users, through: :members
end
