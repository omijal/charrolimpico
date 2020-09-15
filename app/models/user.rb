# frozen_string_literal: true

class User < ApplicationRecord
  validates :username,
            presence: true,
            length: { minimum: 4, maximum: 32 },
            uniqueness: { case_sensitive: false }
  validates :email,
            presence: true,
            length: { minimum: 4, maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :registrations
  has_many :homeworks
  has_many :members
  has_many :organizations, through: :members
  has_many :careers, through: :enrollments
  has_many :tasks, through: :homeworks
  has_many :courses, through: :registrations

  has_secure_password

  before_save do
    email.downcase!
    username.downcase!
  end
end
