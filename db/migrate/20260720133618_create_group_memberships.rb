class CreateGroupMemberships < ActiveRecord::Migration[8.1]
  def change
    create_table :group_memberships do |t|
      t.references :person, null: false, foreign_key: true, index: false
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end

    add_index :group_memberships, [:person_id, :group_id], unique: true
  end
end
