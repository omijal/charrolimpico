# frozen_string_literal: true

class Course < ApplicationRecord
  validates :shortname, presence: true, length: { minimum: 3, maximum: 32 }
  validates :fullname, presence: true, length: { minimum: 3, maximum: 128 }

  belongs_to :organization
  has_many :tasks
  has_many :syllabi
  has_many :registrations
  has_many :problems, through: :tasks
  has_many :careers, through: :syllabi
  has_many :users, through: :registrations
end
