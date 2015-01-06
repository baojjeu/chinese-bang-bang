class Topic < ActiveRecord::Base
  default_scope  { order('created_at desc') }

  after_create :generate_pinyin

  has_many :examples, dependent: :destroy
  has_one :hanyu, as: :pinyinable

  validates :name, presence: true

  accepts_nested_attributes_for :hanyu

  private
    def generate_pinyin
      build_hanyu pinyin: PinYin.sentence(name, :unicode)
      save
    end
end
