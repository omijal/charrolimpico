class AddProblemsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.string(:shortname, null: false)
      t.string(:fullname, null: false)
      t.string(:url, null: false)
      t.integer(:judge_id, null: false)
      t.integer(:organization_id, null: false)
      t.timestamps
    end
  end
end
