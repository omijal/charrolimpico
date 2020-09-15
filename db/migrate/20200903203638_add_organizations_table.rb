class AddOrganizationsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string(:shortname, null: false, uniqueness: true)
      t.string(:fullname, null: false, uniqueness: true)
      t.timestamps
    end
  end
end
