feature 'Update' do
  scenario 'will upate the bookmark' do
    visit('/')
    fill_in('add_bookmark', with: 'https://www.amazon.co.uk')
    fill_in('add_name', with: 'Amazon')
    click_button('Add')
    click_button('View Bookmarks')
    click_button('Amazon_update')
    fill_in('update_url', with: 'https://www.google.co.uk')
    fill_in('update_title', with: 'Google')
    click_button('Update')
    
    expect(page).to have_link('Google', href:'https://www.google.co.uk')
  end
end