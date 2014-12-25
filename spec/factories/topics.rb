FactoryGirl.define do
  factory :topic do
    name '刚刚, 刚才'

    after(:build) do |topic|
      topic.hanyu = FactoryGirl.create(:hanyu, pinyinable_type: 'Topic', pinyinable_id: topic.id)
    end
  end
end
