class Topic < ActiveRecord::Base
  before_create :generate_pinyin

  has_many :examples
  has_one :hanyu, as: :pinyinable

  def generate_pinyin
    build_hanyu pinyin: PinYin.sentence(name, :unicode)
  end
end