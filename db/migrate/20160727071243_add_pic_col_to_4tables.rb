class AddPicColTo4tables < ActiveRecord::Migration
  def change
    add_column :moods, :pic, :text
    add_column :psychos, :pic, :text
    add_column :quests, :pic, :text
    add_column :prenatals, :pic, :text
  end
end
