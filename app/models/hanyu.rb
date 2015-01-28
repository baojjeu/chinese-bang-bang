class Hanyu < ActiveRecord::Base
  belongs_to :pinyinable, polymorphic: true

  validates :meaning, presence: true

  mount_uploader :slow_speaking, SpeakingUploader
  mount_uploader :normal_speaking, SpeakingUploader
end
