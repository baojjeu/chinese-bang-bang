class Hanyu < ActiveRecord::Base
  belongs_to :pinyinable, polymorphic: true

  validates :meaning, presence: true
  # mount_uploader :speaking, SpeakingUploader
end
