require_relative("../db/sql_runner")
class Film

attr_reader :title, :price, :id

def initialize(options)
  @title = options["title"]
  @price = options["price"].to_i
  @id = options["id"].to_i if options["id"]
end

def save()
  sql = "INSERT INTO films (title, price) VALUES ($1, $2)
  RETURNING id"
  values = [@title, @price]
  film = SqlRunner.run(sql, values).first
  @id = film["id"].to_i
end


# class methods below this line
def self.all()
  sql = "SELECT * FROM films"
  film_hashes = SqlRunner.run(sql)
  film = Film.map_items(film_hashes)
  return film
end

def self.map_items(film_hashes)
  result = film_hashes.map{ |film_hash| Film.new(film_hash) }
  return result
end

def self.delete_all
  sql = "DELETE FROM films"
  SqlRunner.run(sql)
end


end
