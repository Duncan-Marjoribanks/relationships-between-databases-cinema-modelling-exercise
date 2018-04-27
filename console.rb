require_relative("models/customer")
require_relative("models/film")
require_relative("models/tickets")
require("pry-byebug")


customer1 = Customer.new({
  "name" => "Barry Jones",
  "funds" => "25"
  })
customer1.save()


film1 = Film.new({
  "title" => "Rainbow Bright 6 - The Bloody End",
  "price" => "5"
  })
film1.save()










  binding.pry
  nil
