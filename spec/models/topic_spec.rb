require 'rails_helper'

RSpec.describe Topic, :type => :model do
  describe "Hanyu Pinyin" do
    it "generate a pinyin before creating" do
      topic = FactoryGirl.create(:topic, name: '刚刚')

      expect(topic.hanyu.try(:pinyin)).to eql 'gāng gāng'
    end
  end
end
