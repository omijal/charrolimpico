# frozen_string_literal: true

class Homework < ApplicationRecord
  belongs_to :task
  belongs_to :user
end
