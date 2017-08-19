require_relative("./customer")
require_relative("./film")
class Ticket

attr_reader(:id)
attr_accessor(:customer_id , :film_id)


def initialize(ticket_info)
@id = ticket_info['id'].to_i
@customer_id = ticket_info['customer_id'].to_i
@film_id= ticket_info['film_id'].to_i
end

def save()
    sql = "INSERT INTO tickets
    (
      customer_id,
      film_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id;"
    values = [@customer_id, @film_id]
    data = SqlRunner.run( sql, values ).first
    @id = data['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tickets;"
    values = []
    tickets = SqlRunner.run(sql, values)
    result = tickets.map { |ticket| Ticket.new( ticket) }
    return result
  end

  def self.delete_all()
  sql = "DELETE FROM tickets;"
  values = []
  SqlRunner.run(sql, values)
end

def customer()
sql = " SELECT * FROM customers
    WHERE id = $1;
"
values = [@customer_id]
results = SqlRunner.run(sql, values)
return Customer.new(result[0])
end

def film()
  sql = " SELECT * FROM customers WHERE id = $1;
  "
  values = [@film_id]
  result = SqlRunner.run(sql, values)
  return Film.new(result[0])

end

end
