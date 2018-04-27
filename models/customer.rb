require_relative("../db/sql_runner")

class Customer

attr_reader :name, :id
attr_accessor :funds

def initialize(options)
  @name = options["name"]
  @funds = options["funds"].to_i
  @id = options["id"].to_i if options["id"]
end


def save()
  sql = "INSERT INTO customers (name, funds) VALUES ($1, $2)
  RETURNING id"
  values = [@name, @funds]
  customer = SqlRunner.run(sql, values).first
  @id = customer["id"].to_i
end






end
