feature 'Testing delete functionality' do
  scenario 'Can delete a link once it has been added' do
    visit('/')
    fill_in('add_url', with: 'http://www.amazon.co.uk')
    fill_in('add_title', with: 'Amazon')
    click_button('Add')
    fill_in('add_url', with: 'http://www.google.com')
    fill_in('add_title', with: 'Google')
    click_button('Add')
    click_button('View Bookmarks')
    click_button('Amazon_delete') #should delete amazon bookmark
    expect(page).not_to have_link('Amazon', href: 'http://www.amazon.co.uk')
  end
end