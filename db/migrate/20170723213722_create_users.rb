class CreateUsers < ActiveRecord::Migration[5.0]
  def change
   create_table :users do |t|
     t.string :username
     t.integer :uid, limit: 8
     t.string :email
     t.string :image
     t.string :name
     t.string :location
     t.string :github
     t.string :blog
     t.string :password_digest
     t.timestamps null: false
   end
  end
end
