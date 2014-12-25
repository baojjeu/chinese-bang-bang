feature 'Creating Topics' do

  before do
    visit '/'
    click_link 'New Topic'
  end

  scenario 'creating a topic' do
    fill_in 'Learning Topic', with: '刚刚'
    fill_in 'Meaning', with: 'Just now.'
    click_button 'Create Topic'

    expect(page).to have_content 'Topic is succesfully created.'
  end
end
