class AddIosTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ios_token, :string
    add_index :users, :ios_token, :unique => true


    User.find_each do |u|
      puts "generate user #{u.id} token"
      u.generate_ios_token
      u.save!
    end
  end
end
