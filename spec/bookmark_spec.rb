# frozen_string_literal: true

require 'bookmark'
require_relative './features/web_helper'

describe Bookmark do
  describe '#all' do
    it 'should return all the element of an array' do
      add_test_bookmarks
      bookmark = Bookmark.all.first
      expect(bookmark.title).to eq('Makers')
      expect(bookmark.url).to eq('http://www.makersacademy.com')
    end
  end

  describe '#create' do
    it 'adds a new bookmark to database' do
      Bookmark.create('www.amazon.co.uk', 'Amazon')
      expect(Bookmark.all.first.title).to eq('Amazon')
      expect(Bookmark.all.first.url).to eq('www.amazon.co.uk')
    end
  end
end
