require_relative("models/customer")
require_relative("models/film")
require_relative("models/tickets")
require("pry-byebug")


customer1 = Customer.new({
  "name" => "Barry Jones",
  "funds" => "25"
  })
customer1.save()













  binding.pry
  nil
