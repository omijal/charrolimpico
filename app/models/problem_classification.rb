# frozen_string_literal: true

class ProblemClassification < ApplicationRecord
  belongs_to :problem
  belongs_to :category
end
