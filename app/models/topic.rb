class Topic < ActiveRecord::Base

  after_create :generate_pinyin

  has_many :examples
  has_one :hanyu, as: :pinyinable

  accepts_nested_attributes_for :hanyu

  private
    def generate_pinyin
      self.hanyu.update pinyin: PinYin.sentence(name, :unicode)
    end
end
