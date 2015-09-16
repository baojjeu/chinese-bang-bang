class Comment < ActiveRecord::Base

  default_scope {order(created_at: :desc) }

  belongs_to :user
  belongs_to :topic
  has_many :replies, class_name: "Comment", foreign_key: 'parent_comment_id'

  validates :content, presence: true
end
