class AddCommentToParents < ActiveRecord::Migration
  def change
  	add_column :parents, :comment, :string
  end
end
