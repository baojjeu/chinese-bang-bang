class User < ActiveRecord::Base

  has_many :stars
  has_many :stared_topics, through: :stars, source: :topic
  has_many :comments

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
end
