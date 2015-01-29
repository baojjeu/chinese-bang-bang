class User < ActiveRecord::Base

  has_one :profile
  has_many :stars, dependent: :destroy
  has_many :stared_topics, through: :stars, source: :topic, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def star!(topic)
    stared_topics << topic
  end

  def unstar!(topic)
    stared_topics.delete(topic)
  end

  def profile
    super || build_profile
  end
end
