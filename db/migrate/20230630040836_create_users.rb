class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :details
      t.string :company_name

      t.timestamps
    end
  end
end
