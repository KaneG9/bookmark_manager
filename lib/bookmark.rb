# frozen_string_literal: true

require 'pg'

class Bookmark
  attr_reader :title, :url, :id

  def initialize(title, url, id)
    @title = title
    @url = url
    @id = id
  end

  def self.all
    conn = PG.connect(dbname: choose_database)
    conn.exec('SELECT * FROM bookmarks').map do |bookmark|
      Bookmark.new(bookmark['title'], bookmark['url'], bookmark['id'])
    end
  end

  def self.create(link, name)
    conn = PG.connect(dbname: choose_database)
    conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{link}', '#{name}')")
  end

  def self.delete(id)
    conn = PG.connect(dbname: choose_database)
    conn.exec("DELETE FROM bookmarks WHERE id = '#{id}'")
  end


  private
  def self.choose_database
    ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end
end
