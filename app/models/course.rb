# frozen_string_literal: true

class Course < ApplicationRecord
  validates :shortname, presence: true, length: { minimum: 3, maximum: 8 }
  validates :fullname, presence: true, length: { minimum: 3, maximum: 128 }

  belongs_to :organization
end
