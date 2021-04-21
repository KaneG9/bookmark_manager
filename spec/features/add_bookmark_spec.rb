# frozen_string_literal: true

require_relative './web_helper'

feature 'testing adding a new bookmark' do
  scenario 'Add a new bookmark and expect our bookmarks page to update' do
    visit('/')
    fill_in('add_bookmark', with: 'www.amazon.co.uk')
    fill_in('add_name', with: 'Amazon')
    click_button('Add')
    click_button('View Bookmarks')
    expect(page).to have_link('Amazon', href: 'www.amazon.co.uk')
  end
end
