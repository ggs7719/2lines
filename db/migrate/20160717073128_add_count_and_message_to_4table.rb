class AddCountAndMessageTo4table < ActiveRecord::Migration
  def change
    add_column :moods, :count, :integer, :default => 0
    add_column :psychos, :count, :integer, :default => 0
    add_column :quests, :count, :integer, :default => 0
    add_column :prenatals, :count, :integer, :default => 0

    add_column :moods, :message, :string
    add_column :psychos, :message, :string
    add_column :quests, :message, :string
    add_column :prenatals, :message, :string

  end
end
