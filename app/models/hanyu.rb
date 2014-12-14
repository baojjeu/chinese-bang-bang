class Hanyu < ActiveRecord::Base
  belongs_to :pinyinable, polymorphic: true
end
