feature 'Viewing Examples' do

  let!(:topic) { FactoryGirl.create(:topic) }
  let!(:example) { FactoryGirl.create(:example, topic: topic) }

  before do
    visit '/'
    click_link 'Topics'
    click_link topic.name
  end

  scenario 'viewing examples' do
    within('#topic .examples') do
      expect(page).to have_content example.sentence
      expect(page).to have_content example.hanyu.pinyin
      expect(page).to have_content example.hanyu.meaning
    end
  end
end
