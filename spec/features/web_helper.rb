# frozen_string_literal: true

require 'pg'

def add_test_bookmarks
  Bookmark.create('http://www.makersacademy.com', 'Makers')
  Bookmark.create('http://askjeeves.com', 'Askjeeves')
  Bookmark.create('http://www.google.com', 'Google')
end

def visit_and_fill_in_with(url, title)
  visit '/'
  fill_in('add_url', with: url)
  fill_in('add_title', with: title)
  click_button('Add')
end
