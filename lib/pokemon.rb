class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize (id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
      sql = <<-SQL
        INSERT INTO pokemon(name, type)
        VALUES (?, ?)
      SQL

      db.execute(sql, name, type)
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
      sql = <<-SQL
        SELECT *
        FROM pokemon
        WHERE id = ?
      SQL

      a = db.execute(sql, id).flatten
      b = self.new(id: a[0], name: a[1], type: a[2], db: db)
      b
    end

end
p = Pokemon.new(id: 1, name: "james", type: "hames", db: "dames")
print p.id
#SQLite3::Database.new('../pokemon.db')