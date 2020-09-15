class AddRolesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string(:name, presence: true, uniqueness: true)
      t.timestamps
    end
  end
end
