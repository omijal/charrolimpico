class AddJudgesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :judges do |t|
      t.string(:shortname, null: false, uniqueness: true)
      t.string(:fullname, null: false)
      t.string(:url, null: false, uniqueness: true)
      t.text(:configs)
      t.timestamps
    end
  end
end
