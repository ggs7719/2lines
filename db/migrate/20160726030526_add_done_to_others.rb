class AddDoneToOthers < ActiveRecord::Migration
  def change
    add_column :moods, :done, :boolean, :default => false
    add_column :psychos, :done, :boolean, :default => false
    add_column :prenatals, :done, :boolean, :dafault => false
  end
end
