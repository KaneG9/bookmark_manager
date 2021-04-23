# frozen_string_literal: true

feature 'Update' do
  scenario 'will update the bookmark' do
    visit_and_fill_in_with('https://www.amazon.co.uk', 'Amazon')
    click_button('View Bookmarks')
    click_button('Amazon_update')
    fill_in('update_url', with: 'https://www.google.co.uk')
    fill_in('update_title', with: 'Google')
    click_button('Update')
    expect(page).to have_link('Google', href: 'https://www.google.co.uk')
    expect(page).not_to have_link('Amazon', href: 'https://www.amazon.co.uk')
  end

  scenario 'bookmark update does not change if nothing is entered' do
    visit_and_fill_in_with('https://www.amazon.co.uk', 'Amazon')
    click_button('View Bookmarks')
    click_button('Amazon_update')
    fill_in('update_url', with: 'https://www.google.co.uk')
    click_button('Update')
    expect(page).to have_link('Amazon', href: 'https://www.google.co.uk')
    expect(page).not_to have_link('Amazon', href: 'https://www.amazon.co.uk')
  end

  scenario 'find method will find a specific bookmark by id' do
    visit_and_fill_in_with('https://www.amazon.co.uk', 'Amazon')
    click_button('View Bookmarks')
    click_button('Amazon_update')
    expect(page).to have_content('Current title: Amazon')
    expect(page).to have_content('Current URL: https://www.amazon.co.uk')
  end
end
