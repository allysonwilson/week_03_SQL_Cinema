equire_relative("../db/sql_runner")
class Customer

def initialize(customer_info)
@id = customer_info[].to_i
@name = customer_info[]
@funds = customer_info[]#does this need to convert to i?

end

end
