require_relative("../customer")
require_relative("../film")
class Ticket

attr_reader (:id)
attr_accessor (:customer_id , :film_id)
#what attributes are appropriate for assigning to accessor here?

def initialize(ticket_info)
@id = ticket_info['id'].to_i
@customer_id = ticket_info['customer_id'].to_i
@film_id= ticket_info['film_id'].to_i
end

end
