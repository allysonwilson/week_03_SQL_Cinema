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





end
