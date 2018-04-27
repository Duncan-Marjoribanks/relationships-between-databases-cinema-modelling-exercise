require_relative("../db/sql_runner")
class Film

attr_reader :title, :price

def initialize(options)
  @title = options["title"]
  @price = options["price"].to_i
  @id = options["id"].to_i if options["id"]
end

def save()
  sql = "INSERT INTO films (title, price) VALUES ($1, $2)
  RETURNING id"
  values = [@title, @price]
  films = SqlRunner.run(sql, values).first
  @id = films["id"].to_i
end


end
