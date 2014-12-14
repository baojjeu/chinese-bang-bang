class Example < ActiveRecord::Base
  belongs_to :topic
  has_one :hanyu, as: :pinyinable
end