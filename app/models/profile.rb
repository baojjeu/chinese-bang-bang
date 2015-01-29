class Profile < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true

  mount_uploader :avatar, ImageUploader
end
