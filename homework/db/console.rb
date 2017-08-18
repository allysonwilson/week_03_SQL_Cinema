require_relative("../models/customer")
require_relative("../models/film")
require_relative("../models/ticket")

require("pry-byebug")



customer1({'name' => 'Sam', "funds" => '20'})
customer2({ 'name' => 'Paul', 'funds' => '30' })


film1({'title' => 'Moonstruck', 'price' => '5'})
film2({'title'=> 'Dirty Dancing', 'price' => '6'})

binding.pry
ticket1({'customer_id' => customer1.id , 'film_id' => film1.id})
ticket2({'customer_id' => customer2.id , 'film_id' => film2.id})


#call all functions for testing in irb
