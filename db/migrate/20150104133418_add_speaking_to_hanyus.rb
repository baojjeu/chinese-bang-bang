class AddSpeakingToHanyus < ActiveRecord::Migration
  def change
    add_column :hanyus, :speaking, :string
  end
end
