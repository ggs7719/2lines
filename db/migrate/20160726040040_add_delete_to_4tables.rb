class AddDeleteTo4tables < ActiveRecord::Migration
  def change
    add_column :moods, :remove, :boolean, :default => false
    add_column :psychos, :remove, :boolean, :default => false
    add_column :quests, :remove, :boolean, :default => false
    add_column :prenatals, :remove, :boolean, :default => false
  end
end
