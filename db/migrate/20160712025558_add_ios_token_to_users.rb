class AddIosTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :ios_token, :string
  end
end
