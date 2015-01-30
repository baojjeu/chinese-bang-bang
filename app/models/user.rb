class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_one :profile
  accepts_nested_attributes_for :profile

  has_many :stars
  has_many :stared_topics, through: :stars, source: :topic, dependent: :destroy

  def star!(topic)
    stared_topics << topic
  end

  def unstar!(topic)
    stared_topics.delete topic
  end

  def profile
    super || build_profile
  end
end
