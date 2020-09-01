# frozen_string_literal: true

class CreateUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string(:username, null: false, uniqueness: true)
      t.string(:email, null: false, uniqueness: true)
      t.string(:password_digest, null: false)
      t.timestamps
    end
  end
end
