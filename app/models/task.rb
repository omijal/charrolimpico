# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :problem
  belongs_to :course
end
