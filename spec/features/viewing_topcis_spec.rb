feature 'Viewing Topics' do

  let!(:topic) { FactoryGirl.create(:topic) }

  before do
    visit '/'
    click_link 'Topics'
    click_link topic.name
  end

  scenario 'viewing a topic with complete information' do
    within('#topic') do
      expect(page).to have_content topic.name
      expect(page).to have_content topic.hanyu.pinyin
      expect(page).to have_content topic.hanyu.meaning
    end
  end
end
