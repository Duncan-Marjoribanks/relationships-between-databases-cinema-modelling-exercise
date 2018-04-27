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

def self.all()
  sql = "SELECT * FROM customers"
  customer_hashes = SqlRunner.run(sql)
  return Customer.map_items(customer_hashes)
end

def self.map_items(customer_hashes)
result = customer_hashes.map{ |customer_hash| Customer.new(customer_hash)}
return result
end




end
