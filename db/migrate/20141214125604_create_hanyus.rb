class CreateHanyus < ActiveRecord::Migration
  def change
    create_table :hanyus do |t|
      t.string :pinyin
      t.references :pinyinable, polymorphic: true

      t.timestamps
    end
  end
end
