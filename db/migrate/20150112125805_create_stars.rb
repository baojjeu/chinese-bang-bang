class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.belongs_to :user, index: true
      t.belongs_to :topic, index: true

      t.timestamps
    end
  end
end
