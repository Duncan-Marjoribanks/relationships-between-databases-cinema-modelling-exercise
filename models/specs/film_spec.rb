require("minitest/autorun")
require("minitest/rg")
require_relative("../film")

class FilmTest < MiniTest::Test

def setup
  @film_1 = Film.new({
    "title" => "Testing his Patience",
    "price" => "5"
    })
end

def test_has_title()
  assert_equal("Testing his Patience", @film_1.title)
end

def test_has_price()
  assert_equal(5, @film_1.price)
end


end
