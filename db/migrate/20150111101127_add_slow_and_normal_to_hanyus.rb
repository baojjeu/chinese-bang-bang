class AddSlowAndNormalToHanyus < ActiveRecord::Migration
  def change
    add_column :hanyus, :slow_id, :string
    add_column :hanyus, :normal_id, :string
    remove_column :hanyus, :speaking, :string
  end
end
