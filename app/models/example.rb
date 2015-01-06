class Example < ActiveRecord::Base

  after_create :generate_pinyin

  belongs_to :topic
  has_one :hanyu, as: :pinyinable

  validates :sentence, presence: true

  accepts_nested_attributes_for :hanyu

  private
    def generate_pinyin
      build_hanyu pinyin: PinYin.sentence(sentence, :unicode)
      save
    end
end
