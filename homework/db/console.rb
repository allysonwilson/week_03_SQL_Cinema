require_relative("../models/customer")
require_relative("../models/film")
require_relative("../models/ticket")

require("pry-byebug")



customer1 = Customer.new({'name' => 'Sam', "funds" => '20'})
customer2 = Customer.new({ 'name' => 'Paul', 'funds' => '30' })


film1 = Film.new({'title' => 'Moonstruck', 'price' => '5'})
film2 = Film.new({'title'=> 'Dirty Dancing', 'price' => '6'})

binding.pry
ticket1 = Ticket.new({'customer_id' => customer1.id , 'film_id' => film1.id})
ticket2= Ticket.new({'customer_id' => customer2.id , 'film_id' => film2.id})


#call all functions for testing in pry
#run console.rb in terminal then cinema.sql, database not populating?
