# frozen_string_literal: true

class Course < ApplicationRecord
  validates :shortname, presence: true, length: { minimum: 3, maximum: 32 }
  validates :fullname, presence: true, length: { minimum: 3, maximum: 128 }

  belongs_to :organization
  has_many :problems, though: :tasks
  has_many :courses, through: :syllabi
  has_many :users, through: :registrations
end
