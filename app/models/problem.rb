# frozen_string_literal: true

class Problem < ApplicationRecord
  validates :shortname, presence: true, length: { minimum: 3, maximum: 32 }
  validates :fullname, presence: true, length: { minimum: 3, maximum: 128 }
  validates :url, presence: true, length: { minimum: 3, maximum: 128 },
                  format: { with: URI::DEFAULT_PARSER.make_regexp }
  belongs_to :organization
  belongs_to :judge
  has_many :courses, through: :tasks
  has_many :problem_classifications
  has_many :categories, through: :problem_classifications
end
