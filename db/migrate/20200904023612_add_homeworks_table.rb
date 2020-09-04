class AddHomeworksTable < ActiveRecord::Migration[6.0]
  def change
    create_table :homeworks do |t|
      t.integer(:user_id, presence: true)
      t.integer(:task_id, presence: true)
      t.string(:status, presence: true)
      t.timestamp(:delivery_time)
      t.timestamps
    end
  end
end
