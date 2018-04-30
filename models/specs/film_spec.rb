require("minitest/autorun")
require("minitest/rg")
require_relative("../film")
require_relative("../customer")
require_relative("../ticket")

class FilmTest < MiniTest::Test

  def setup
    @film_1 = Film.new({
      "title" => "Testing his Patience",
      "price" => "5"
      })
      @customer_1 = Customer.new({
        "name" => "Billy Tangmonger",
        "funds" => "40"
        })
      @customer_2 = Customer.new({
        "name" => "Sunny Lebeau",
        "funds" => "100"
        })
      @ticket_1 = Ticket.new({
        "customer_id" => 20,
        "film_id" => @film_1.id()
        })
      # @ticket_2 = Ticket.new({
      #   "customer_id" => @customer2[0],
      #   "film_id" => @film_1[0]
      #   })
  end

    def test_has_title()
      assert_equal("Testing his Patience", @film_1.title)
    end

    def test_has_price()
      assert_equal(5, @film_1.price)
    end

    def test_count_customers()
      result = @film_1.customers
      assert_equal(1, result.count())
    end
end
