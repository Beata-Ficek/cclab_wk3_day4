class Star

  attr_accessor :first_name, :last_name, :id

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = 'INSERT INTO stars
    (first_name, last_name) VALUES ($1, $2) RETURNING *;'
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def star()
    sql = "SELECT * FROM stars WHERE id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return Star.new(result.first)
  end

  def update()
    sql = "UPDATE stars
    SET first_name = $1, last_name = $2
    WHERE id = $3;"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM stars WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM stars;"
    SqlRunner.run(sql)
  end

end
