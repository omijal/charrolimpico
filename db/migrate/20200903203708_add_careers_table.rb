class AddCareersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :careers do |t|
      t.string(:shortname, null: false)
      t.string(:fullname, null: false)
      t.integer(:organization_id, null: false)
      t.timestamps
    end
  end
end
