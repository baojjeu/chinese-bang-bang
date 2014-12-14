feature 'Creating Topics' do
  let!(:topic) { FactoryGirl.create(:topic) }

  before do
    visit '/'
    click_link 'New Topic'
  end

  scenario 'Creating a topic' do
    fill_in 'Learning Topic', with: topic.name
    click_button 'Create Topic'

    expect(page).to have_content "Topic [#{topic.name}] is succesfully created."
    expect(page).to have_content topic.name
  end
end