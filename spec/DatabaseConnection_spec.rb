require 'DatabaseConnection'
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
      rs = DatabaseConnection.query("SELECT * FROM bookmarks")
      bookmark = rs.map{ |bookmark| Bookmark.new(bookmark['title'], bookmark['url'], bookmark['id']) }
      expect(bookmark.first.url).to eq 'www.amazon.co.uk'
      expect(bookmark.first.title).to eq 'Amazon'
    end
  end
end
