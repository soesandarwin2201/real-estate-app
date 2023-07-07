class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.integer :bathroom
      t.integer :bedroom
      t.string :address
      t.string :home_status
      t.string :home_type
      t.boolean :advertise
      t.float :price
      t.string :desc
      t.string :square
      t.string :zone
      t.integer :floor
      t.boolean :tv
      t.boolean :bacon
      t.boolean :ac
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
