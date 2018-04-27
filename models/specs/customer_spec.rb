require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new({"name" => "Brenda Jarvie", "funds" => "50"})
  end

  def test_has_funds()
    assert_equal(50, @customer1.funds)
  end

  def test_can_remove_money_from_funds()
    @customer1.reduce_funds(20)
    assert_equal(30, @customer1.funds)
  end

  def test_can_add_money_to_funds()
    @customer1.increase_funds(45)
    assert_equal(95, @customer1.funds)
  end
end
