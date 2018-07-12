class Casting

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @movie_id = options['movie_id'].to_i
    @star_id = options['star_id'].to_i
    @fee = options['fee'].to_i
  end


    def save()
      sql = 'INSERT INTO castings
      (movie_id, star_id, fee) VALUES ($1, $2, $3) RETURNING *;'
      values = [@movie_id, @star_id, @fee]
      result = SqlRunner.run(sql, values)
      @id = result.first['id'].to_i
    end

    def casting()
      sql = "SELECT * FROM castings WHERE id = $1;"
      values = [@id]
      result = SqlRunner.run(sql, values)
      return Casting.new(result.first)
    end

    def update()
      sql = "UPDATE casting
      SET movie_id = $1, star_id = $2, fee = $3
      WHERE id = $4;"
      values = [@movie_id, @star_id, @fee]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM castings WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all()
      sql = "DELETE FROM castings;"
      SqlRunner.run(sql)
    end


end
