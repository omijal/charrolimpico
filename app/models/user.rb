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

  has_secure_password

  before_save do
    email.downcase!
    username.downcase!
  end
end
