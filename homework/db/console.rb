require_relative("../models/customer")
require_relative("../models/film")
require_relative("../models/ticket")

require("pry-byebug")

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()




customer1 = Customer.new({'name' => 'Sam', "funds" => '20'})
customer1.save()
customer2 = Customer.new({ 'name' => 'Paul', 'funds' => '30' })
customer2.save()

film1 = Film.new({'title' => 'Moonstruck', 'price' => '5'})
film1.save()
film2 = Film.new({'title'=> 'Dirty Dancing', 'price' => '6'})
film2.save()


ticket1 = Ticket.new({'customer_id' => customer1.id , 'film_id' => film1.id})
ticket1.save()
ticket2= Ticket.new({'customer_id' => customer2.id , 'film_id' => film2.id})
ticket2.save()

binding.pry
nil

#call all functions for testing in pry
#run console.rb in terminal then cinema.sql, database not populating?
