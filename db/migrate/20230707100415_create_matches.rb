class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.boolean :liked
      t.integer :browsed_user_id
      t.string :pair_id
      t.datetime :last_read_at

      t.timestamps
    end
    add_index :matches, :browsed_user_id
  end
end
