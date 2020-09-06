class AddMembershipTable < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.integer(:user_id, presence: true)
      t.integer(:organization_id, presence: true)
      t.integer(:role_id, presence: true)
      t.timestamps
    end
  end
end
