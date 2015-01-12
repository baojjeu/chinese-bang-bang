class Topic < ActiveRecord::Base
  default_scope  { order('created_at desc') }
  scope :is_published, -> { where.not(published_at: nil) }

  after_save :generate_pinyin

  has_many :stars
  has_many :collectors, through: :stars, source: :user

  has_many :examples, dependent: :destroy
  has_one :hanyu, as: :pinyinable

  validates :name, presence: true

  accepts_nested_attributes_for :hanyu


  def published?
    published_at?
  end

  private
    def generate_pinyin
      self.hanyu.update pinyin: PinYin.sentence(name, :unicode)
    end
end
