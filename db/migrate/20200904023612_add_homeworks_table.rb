class AddHomeworksTable < ActiveRecord::Migration[6.0]
  def change
    create_table :homework do |t|
      t.integer(:userd_id, presence: true)
      t.integer(:task_id, presence: true)
      t.string(:status, presence: true)
      t.timestamp(:delivery_time)
      t.timestamps
    end
  end
end
