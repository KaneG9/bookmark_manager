# frozen_string_literal: true

class DatabaseConnection
  def self.setup(name)
    @conn = PG.connect(dbname: name)
  end

  def self.query(query)
    @conn.exec(query)
  end
end
