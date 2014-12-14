class CreateHanyus < ActiveRecord::Migration
  def change
    drop_table :hanyus
    drop_table :hanyupinyins

    create_table :hanyus do |t|
      t.string :pinyin
      t.references :pinyinable, polymorphic: true

      t.timestamps
    end
  end
end
