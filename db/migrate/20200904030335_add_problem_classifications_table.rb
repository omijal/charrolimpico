class AddProblemClassificationsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :problem_classifications do |t|
      t.integer(:problem_id, presence: true)
      t.integer(:category_id, presence: true)
    end
  end
end
