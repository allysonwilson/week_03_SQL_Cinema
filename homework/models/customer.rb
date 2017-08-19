require_relative("../db/sql_runner")


class Customer

  attr_reader(:id)
  attr_accessor(:name, :funds)

  def initialize(customer_info)
    @id = customer_info['id'].to_i
    @name = customer_info['name']
    @funds = customer_info['funds'].to_i
  end


  def save()
    sql = "INSERT INTO customers
    (
      name,
      funds
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @funds]
    data = SqlRunner.run( sql, values ).first
    @id = data['id'].to_i
  end

  def update()
    sql = ' UPDATE customers SET (
  name, funds) = ( $1, $2 ) WHERE id = $3 ;'
    values = [@name , @funds]
    SqlRunner.run(sql, values)
    return Customer.new(result[0])
  end

  def self.all()
      sql = "SELECT * FROM users"
      values = []
      users = SqlRunner.run(sql, values)
      result = User.map_items(users)
      return result
    end

    def self.delete_all()
      sql = "DELETE FROM customers"
      values = []
      SqlRunner.run(sql, values)
    end

    def films_seen()
      sql = "
      SELECT films.* FROM films
       INNER JOIN tickets ON film.id = ticket.film_id
        WHERE customer_id = $1;
      "
      #your selecting from table that you want array returned from
      values = [@id]
      result = SqlRunner.run(sql , values)
      return Film.map_items(results)
    end

    def self.map_items(rows)
      return rows.map { |row| Customer.new(row) }
    end

end
