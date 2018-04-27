require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")
require_relative("../film")
require_relative("../ticket")

class CustomerTest < MiniTest::Test

  def setup
    @customer_1 = Customer.new({
      "name" => "Brenda Jarvie",
      "funds" => "50"
      })
      @film_1 = Film.new({
        "title" => "The rubbish escape",
        "price" => "10"
        })
  end

    def test_has_funds()
      assert_equal(50, @customer_1.funds)
    end

    def test_can_remove_money_from_funds()
      @customer_1.reduce_funds(20)
      assert_equal(30, @customer_1.funds)
    end

    def test_can_add_money_to_funds()
      @customer_1.increase_funds(45)
      assert_equal(95, @customer_1.funds)
    end

    def test_customer_can_buy_ticket()
      @customer_1.buy_ticket(@film_1)
      assert_equal(40, @customer_1.funds)
    end

    def test_can_count_tickets()
      @customer_1.buy_ticket(@film_1)
      result = @customer_1.count_tickets()
      assert_equal(1, result)
    end


end
