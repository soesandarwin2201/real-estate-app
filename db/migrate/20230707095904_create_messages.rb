class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.text :content
      t.string :pair_id

      t.timestamps
    end
    add_index :messages, :sender_id
    add_index :messages, :recipient_id
  end
end
