RSpec.describe Example, type: :model do
  it "generate a pinyin before creating" do
    topic = FactoryGirl.create(:topic)
    example = FactoryGirl.create(:example, topic: topic)

    expect(example.hanyu.try(:pinyin)).to eql PinYin.sentence(example.sentence, :unicode)
  end
end