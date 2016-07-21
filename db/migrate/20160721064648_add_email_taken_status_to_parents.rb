class AddEmailTakenStatusToParents < ActiveRecord::Migration
  def change
  	add_column :parents, :email,  :string
    add_column :parents, :token,  :string
    add_column :parents, :status, :string
    add_index  :parents, :token, :unique => true
  end
end
