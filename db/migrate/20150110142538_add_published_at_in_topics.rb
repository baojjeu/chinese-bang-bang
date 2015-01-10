class AddPublishedAtInTopics < ActiveRecord::Migration
  def change
    add_column :topics, :published_at, :datetime
  end
end
