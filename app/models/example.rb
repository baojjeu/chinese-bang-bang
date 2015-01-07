class Example < ActiveRecord::Base

  default_scope  { order('created_at asc') }

  after_create :generate_pinyin

  belongs_to :topic
  has_one :hanyu, as: :pinyinable

  validates :sentence, presence: true

  accepts_nested_attributes_for :hanyu

  private
    def generate_pinyin
      self.hanyu.update pinyin: PinYin.sentence(sentence, :unicode)
    end
end
