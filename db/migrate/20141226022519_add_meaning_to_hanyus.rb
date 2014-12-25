class AddMeaningToHanyus < ActiveRecord::Migration
  def change
    add_column :hanyus, :meaning, :string
  end
end
