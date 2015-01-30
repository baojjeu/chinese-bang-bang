class Topic < ActiveRecord::Base
  default_scope  { order('created_at desc') }
  scope :were_published, -> { where.not(published_at: nil) }
  scope :draft, -> { where(published_at: nil) }

  after_save :generate_pinyin

  has_many :stars
  has_many :collectors, through: :stars, source: :user, dependent: :destroy

  has_many :examples, dependent: :destroy
  has_one :hanyu, as: :pinyinable, dependent: :destroy

  has_many :comments, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :hanyu


  def published?
    published_at?
  end

  def hanyu
    super || build_hanyu
  end

  def generate_pinyin
    hanyu.update pinyin: PinYin.sentence(name, :unicode)
  end
end
