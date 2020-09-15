class AddCoursesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string(:shortname, null: false, uniqueness: true)
      t.string(:fullname, null: false, uniqueness: true)
      t.integer(:organization_id, null: false)
      t.timestamps
    end
  end
end
