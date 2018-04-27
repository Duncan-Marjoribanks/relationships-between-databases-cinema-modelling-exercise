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

  def test_money_can_leave_funds()
    @customer1.reduce_funds(20)
    assert_equal(30, @customer1.funds)
  end

end
