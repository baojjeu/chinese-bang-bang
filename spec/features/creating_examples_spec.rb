feature 'Creating Examples' do

  let!(:topic) { FactoryGirl.create(:topic) }

  before do
    visit '/'
    click_link 'Topics'
    click_link topic.name
    click_link 'New Example'
  end

  scenario 'creating a example' do
    fill_in 'Example Sentence', with: '弟弟刚刚把拉面吃掉了。'
    fill_in 'Meaning', with: 'Brother ate ramen just now.'
    click_button 'Create Example'

    expect(page).to have_content "Example is succesfully created."
  end
end
