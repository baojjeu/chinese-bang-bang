FactoryGirl.define do
  factory :example do
    sentence "要吃多一点, 知道吗？"

    after(:build) do |example|
      example.hanyu = FactoryGirl.create(:hanyu, pinyinable_type: 'Example', pinyinable_id: example.id)
    end
  end
end
