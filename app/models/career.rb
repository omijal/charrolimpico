# frozen_string_literal: true

class Career < ApplicationRecord
  validates :shortname, presence: true, length: { minimum: 3, maximum: 8 }
  validates :fullname, presence: true, length: { minimum: 3, maximum: 128 }

  belongs_to :organization
  has_many :enrollments
  has_many :syllabi
  has_many :users, through: :enrollments
  has_many :curses, through: :syllabi
end
