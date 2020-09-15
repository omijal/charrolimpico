class AddEnrollmentsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.integer(:user_id, presence: true)
      t.integer(:career_id, presence: true)
      t.integer(:role_id, presence: true)
      t.timestamps
    end
  end
end
