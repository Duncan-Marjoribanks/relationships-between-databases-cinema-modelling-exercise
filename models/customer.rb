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

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.customer_id = $1"
    values = [@id]
    film_hashes = SqlRunner.run(sql, values)
    films = Film.map_items(film_hashes)
    return films
  end

  def reduce_funds(amount)
    @funds -= amount
  end

  def increase_funds(amount)
    @funds += amount
  end

  # def buy_ticket(film)
  #   sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, film_id) INNER JOIN films ON film_id WHERE film.title = $3"
  #   values = [@id, film.]
  #   SqlRunner.run(sql, values)
  #   reduce_funds(film.price)
  # end

  def count_tickets()
    sql = "SELECT * FROM tickets WHERE customer_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.count()
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
