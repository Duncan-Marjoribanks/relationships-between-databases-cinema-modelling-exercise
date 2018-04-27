require_relative("../db/sql_runner")

class Customer

attr_reader :id
attr_accessor :name, :funds

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

def update()
  sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
  values = [@name, @funds, @id]
  result = SqlRunner.run(sql, values)
  return result

end


#class methods below this line

def self.all()
  sql = "SELECT * FROM customers"
  customer_hashes = SqlRunner.run(sql)
  return Customer.map_items(customer_hashes)
end

def self.map_items(customer_hashes)
result = customer_hashes.map{ |customer_hash| Customer.new(customer_hash)}
return result
end

def self.delete_all
  sql = "DELETE FROM customers"
  SqlRunner.run(sql)
end




end
