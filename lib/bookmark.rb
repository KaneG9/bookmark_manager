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
    rs = DatabaseConnection.query('SELECT * FROM bookmarks')
    rs.map { |bookmark| Bookmark.new(bookmark['title'], bookmark['url'], bookmark['id']) }
  end

  def self.create(link, name)
    return false unless valid_url(link)

    DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{link}', '#{name}')")
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = '#{id}'")
  end

  def self.update(id, url = '', title = '')
    DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}' WHERE id = '#{id}'") unless url == ''
    DatabaseConnection.query("UPDATE bookmarks SET title = '#{title}' WHERE id = '#{id}'") unless title == ''
  end

  def self.find(id)
    rs = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = '#{id.to_i}'")
    bookmark = rs.map { |bm| Bookmark.new(bm['title'], bm['url'], bm['id']) }
    bookmark.first
  end

  private_class_method

  def self.valid_url(url)
    url.match(URI::DEFAULT_PARSER.make_regexp)
  end
end
