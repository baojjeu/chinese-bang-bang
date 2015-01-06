class AddInfoToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :info, :text
  end
end
