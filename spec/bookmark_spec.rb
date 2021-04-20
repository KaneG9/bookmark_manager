require "bookmark"
require_relative "./features/web_helper.rb"

describe Bookmark do
  describe "#initialize" do
    it "has a name" do
      b = Bookmark.new("Google")
      expect(b.name).to eq "Google"
    end
  end

  describe "#all" do
    it "should return all the element of an array" do
      add_test_bookmarks
      expect(Bookmark.all).to include("http://www.makersacademy.com", "http://askjeeves.com", "http://www.google.com")
    end
  end

  describe '#create' do
    it 'adds a new bookmark to database' do
      Bookmark.create('www.amazon.co.uk')
      expect(Bookmark.all).to include('www.amazon.co.uk')
    end
  end
end
