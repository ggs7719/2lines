class Add3ColToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :nick_name, :string
  	add_column :users, :sexuality, :string
  	add_column :users, :due_date, :date

  	add_index :users, :due_date

  end
end
