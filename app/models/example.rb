class Example < ActiveRecord::Base

  after_create :generate_pinyin

  belongs_to :topic
  has_one :hanyu, as: :pinyinable

  accepts_nested_attributes_for :hanyu

  private
    def generate_pinyin
      self.hanyu.update pinyin: PinYin.sentence(sentence, :unicode)
    end
end
