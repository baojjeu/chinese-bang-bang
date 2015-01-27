class AddTopicIdToComments < ActiveRecord::Migration
  def change
    remove_column :comments, :commentable_id, :integer
    remove_column :comments, :commentable_type, :string
    add_reference :comments, :topic, index: true
  end
end
