# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :problem
  belongs_to :course
  has_many :homeworks
  has_many :users, through: :homeworks
end
