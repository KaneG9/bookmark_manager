# frozen_string_literal: true

require 'database_connection'
require 'pg'

describe DatabaseConnection do
  describe '#setup' do
    it 'connects to test database' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '#query' do
    it 'executes query on database' do
      DatabaseConnection.setup('bookmark_manager_test')
      DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('www.amazon.co.uk', 'Amazon')")
      rs = DatabaseConnection.query('SELECT * FROM bookmarks')
      bookmark = rs.map { |row| [row['title'], row['url'], row['id']] }
      expect(bookmark[0][1]).to eq 'www.amazon.co.uk'
      expect(bookmark[0][0]).to eq 'Amazon'
    end
  end
end
