class AddRegistrationsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :registrations do |t|
      t.integer(:user_id, presence: true)
      t.integer(:course_id, presence: true)
      t.string(:status, presence: true)
    end
  end
end
