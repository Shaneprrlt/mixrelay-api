class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.boolean :phone_verified, null: false, default: false
      t.boolean :email_verified, null: false, default: false
      t.string :password_digest
      t.boolean :banned, null: false, default: false
      t.string :profile_image_url
      t.integer :status

      t.timestamps
    end
  end
end
