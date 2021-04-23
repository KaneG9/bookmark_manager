feature 'testing for valid URLs' do
  scenario 'invalid URL entered into add' do
    visit '/'
    fill_in('add_url', with: 'hello')
    fill_in('add_title', with: 'Amazon')
    click_button('Add')
    expect(page).to have_content('Error: Invalid URL entered')
    expect(Bookmark.all).to be_empty
  end

  # scenario 'invalid URL entered into update' do
    
  # end

end