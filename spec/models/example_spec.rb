RSpec.describe Example, type: :model do
  it "generate a pinyin before creating" do
    topic = FactoryGirl.create(:topic)
    example = FactoryGirl.create(:example, topic: topic, sentence: '弟弟刚刚把拉面吃掉了。')

    expect(example.hanyu.try(:pinyin)).to eql 'dì di gāng gāng bǎ lā miàn chī diào le.'
  end
end