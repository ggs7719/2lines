class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|

      t.timestamps null: false
      t.string   :title
      t.string   :content
      t.datetime :date
      t.boolean  :status, default: false
      t.integer  :mother_id
      t.integer  :father_id
      t.boolean  :done, default: false
    end
  end
end
