class AddTasksTable < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer(:problem_id, null: false)
      t.integer(:course_id, null: false)
      t.timestamps
    end
  end
end
