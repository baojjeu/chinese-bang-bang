feature 'Viewing topcis' do
  let!(:topic) { FactoryGirl.create(:topic) }

  before do
    visit '/'
  end

  scenario 'Viewing a topic with hanyu pinyin' do
    click_link 'Topics'
    click_link topic.name

    expect(page).to have_content PinYin.sentence(topic.name, :unicode)
  end
end