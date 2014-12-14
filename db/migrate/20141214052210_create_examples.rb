class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.string :sentence

      t.timestamps
    end
  end
end
