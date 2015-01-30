class Example < ActiveRecord::Base

  default_scope  { order('created_at asc') }

  after_create :generate_pinyin

  belongs_to :topic
  has_one :hanyu, as: :pinyinable, dependent: :destroy

  validates :sentence, presence: true

  accepts_nested_attributes_for :hanyu

  def hanyu
    super || build_hanyu
  end

  def generate_pinyin
    hanyu.update pinyin: PinYin.sentence(sentence, :unicode)
  end
end
