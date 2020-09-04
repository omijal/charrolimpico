# frozen_string_literal: true

class Judge < ApplicationRecord
  validates :shortname,
            presence: true,
            length: { minimum: 2, maximum: 8 },
            uniqueness: { case_sensitive: false },
            format: { with: /\A\w+\z/ }

  validates :fullname,
            presence: true,
            length: { minimum: 2, maximum: 255 }

  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :configs, presence: true

  has_many :problems

  before_save do
    self.configs = configs.to_json
  end
end
