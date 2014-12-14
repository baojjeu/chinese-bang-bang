class AddTopicIdToExamples < ActiveRecord::Migration
  def change
    add_reference :examples, :topic, index: true
  end
end
