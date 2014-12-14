require 'rails_helper'

RSpec.describe Topic, :type => :model do
  describe "Hanyu Pinyin" do
    it "generate a pinyin before creating topic" do
      t = Topic.create(name: '肚子饿吗？')
      expect(t.hanyu.try(:pinyin)).to eql PinYin.sentence(t.name, :unicode)
    end
  end
end
