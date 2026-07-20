class CreatePeople < ActiveRecord::Migration[8.1]
  def change
    create_table :people do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.integer :birthday_day
      t.integer :birthday_month
      t.integer :birthday_year

      t.boolean :favorite, null: false, default: false

      t.timestamps
    end
  end
end
