class AddSlowSpeakingToHanyus < ActiveRecord::Migration
  def change
    remove_column :hanyus, :speaking, :string
    add_column :hanyus, :slow_speaking, :string
    add_column :hanyus, :normal_speaking, :string
  end
end
