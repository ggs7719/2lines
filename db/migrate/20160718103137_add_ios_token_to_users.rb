class AddIosTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :ios_token, :string
  	add_index :users, :ios_token, :unique => true
  end
end
