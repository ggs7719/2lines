class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|

      t.integer :mother_id
      t.integer :father_id
      t.timestamps null: false
    end
  end
end
