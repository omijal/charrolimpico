# frozen_string_literal: true

class Syllabus < ApplicationRecord
  belongs_to :career
  belongs_to :course
end
