# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 32 }
  validates :organization_id, presence: true

  belongs_to :organization
  has_many :problems, through: :problem_classifications
end
