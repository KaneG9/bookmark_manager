feature 'Update' do
  scenario 'will update the bookmark' do
    visit('/')
    fill_in('add_url', with: 'https://www.amazon.co.uk')
    fill_in('add_title', with: 'Amazon')
    click_button('Add')
    click_button('View Bookmarks')
    click_button('Amazon_update')
    fill_in('update_url', with: 'https://www.google.co.uk')
    fill_in('update_title', with: 'Google')
    click_button('Update')
    expect(page).to have_link('Google', href:'https://www.google.co.uk')
    expect(page).not_to have_link('Amazon', href:'https://www.amazon.co.uk')
  end

  scenario 'bookmark update does not change if nothing is entered' do
    visit('/')
    fill_in('add_url', with: 'https://www.amazon.co.uk')
    fill_in('add_title', with: 'Amazon')
    click_button('Add')
    click_button('View Bookmarks')
    click_button('Amazon_update')
    fill_in('update_url', with: 'https://www.google.co.uk')
    click_button('Update')
    expect(page).to have_link('Amazon', href:'https://www.google.co.uk')
    expect(page).not_to have_link('Amazon', href:'https://www.amazon.co.uk')
  end

  scenario 'find method will find a specific bookmark by id' do
    visit('/')
    fill_in('add_url', with: 'https://www.amazon.co.uk')
    fill_in('add_title', with: 'Amazon')
    click_button('Add')
    click_button('View Bookmarks')
    click_button('Amazon_update')
    expect(page).to have_content('Current title: Amazon')
    expect(page).to have_content('Current URL: https://www.amazon.co.uk')
  end
end
