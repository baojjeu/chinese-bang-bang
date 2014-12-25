require 'rails_helper'

RSpec.describe Topic, :type => :model do
  describe "Hanyu Pinyin" do
    it "generate a pinyin before creating" do
      topic = FactoryGirl.create(:topic)

      expect(topic.hanyu.try(:pinyin)).to eql PinYin.sentence(topic.name, :unicode)
    end
  end
end
