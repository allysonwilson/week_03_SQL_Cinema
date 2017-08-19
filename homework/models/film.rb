require_relative('./customer')

class Film

attr_reader(:id)
attr_accessor(:title , :price)

def initialize(film_details)
@id = film_details['id'].to_i
@title = film_details['title']
@price= film_details['price'].to_i
end

def save()
    sql = "INSERT INTO films
    (
      title,
      price
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@title, @price]
    data = SqlRunner.run( sql, values ).first
    @id = data['id'].to_i
  end

  def update()
    sql = ' UPDATE films SET (
  title, price) = ( $1 , $2 ) WHERE id = $3 ;'
    values = [@title, @price]
    SqlRunner.run(sql, values)
    return Film.new(result[0])
  end

  def self.all()
    sql = "SELECT * FROM locations"
    values = []
    films = SqlRunner.run(sql, values)
    result = films.map_items(results)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

  def customer()
  sql = "
    SELECT customers.* FROM customers
      INNER JOIN tickets ON tickets.customer_id = customers.id
      WHERE film_id = $1
  "
  values = [@id]
  results = SqlRunner.run(sql, values)
  return Customer.map_items(results)
  end

  def self.map_items(rows)
    return rows.map { |row| Film.new(row)}
  end


end
