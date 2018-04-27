require_relative("models/customer")
require_relative("models/film")
require_relative("models/ticket")
require("pry-byebug")

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

#customer instances
customer1 = Customer.new({
  "name" => "Marmaduke Jones",
  "funds" => "25"
  })
customer1.save()

customer2 = Customer.new({
  "name" => "Jemima Bain",
  "funds" => "40"
  })
customer2.save()

#film instances
film1 = Film.new({
  "title" => "Rainbow Bright 6 - The Bloody End",
  "price" => "5"
  })
film1.save()

film2 = Film.new({
  "title" => "Dr Harold Shipman - a love story",
  "price" => "10"
  })
film2.save()


#ticket instances
ticket1 = Ticket.new({
  "customer_id" => customer1.id,
  "film_id" => film1.id
  })
ticket1.save()

ticket2 = Ticket.new({
  "customer_id" => customer2.id,
  "film_id" => film2.id
  })
ticket2.save()

ticket3 = Ticket.new({
  "customer_id" => customer1.id,
  "film_id" => film2.id
  })
ticket3.save()




  binding.pry
  nil
