class AddSyllabiTable < ActiveRecord::Migration[6.0]
  def change
    create_table :syllabi do |t|
      t.integer(:course_id, presence: true)
      t.integer(:career_id, presence: true)
      t.timestamps
    end
  end
end
