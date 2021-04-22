# frozen_string_literal: true

require 'pg'

def add_test_bookmarks
  Bookmark.create('http://www.makersacademy.com', 'Makers')
  Bookmark.create('http://askjeeves.com', 'Askjeeves')
  Bookmark.create('http://www.google.com', 'Google')
end
