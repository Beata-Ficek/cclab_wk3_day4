require_relative('../db/sql_runner')
require_relative('star')
class Movie

  attr_accessor :title, :genre, :id

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = 'INSERT INTO movies
    (title, genre) VALUES ($1, $2) RETURNING *;'
    values = [@title, @genre]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def movie()
    sql = "SELECT * FROM movies WHERE id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return Movie.new(result.first)
  end

  def update()
    sql = "UPDATE movies
    SET title = $1, genre = $2
    WHERE id = $3;"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM movies WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM movies;"
    SqlRunner.run(sql)
  end

  def stars()
    sql = "SELECT stars.*
    FROM stars
    INNER JOIN castings
    ON stars.id = castings.star_id
    WHERE movie_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |star_hash| Star.new(star_hash) }
  end

end
