feature 'Creating Examples' do
  let!(:topic) { FactoryGirl.create(:topic) }
  let!(:example) { FactoryGirl.create(:example) }

  before do
    visit '/'
    click_link 'Topics'
    click_link topic.name
    click_link 'New Example'
  end

  scenario 'Creating a example' do
    fill_in 'Example Sentence', with: example.sentence
    click_button 'Create Example'

    expect(page).to have_content "Example is succesfully created."
    expect(page).to have_content example.sentence
  end
end