require_relative('models/movie')
require_relative('models/star')
require_relative('models/casting')

# Star.delete_all()
# Movie.delete_all()

bee_movie = Movie.new(
  {"title" => "The Bee movie",
    "genre" =>"adventure - comedy"}
  )
  bee_movie.save()

p bee_movie.movie.title
bee_movie.title = "The bee movie 2"
bee_movie.update()

# bee_movie.delete()

  barry_bee = Star.new(
    {
      "first_name" => "Barry",
      "last_name" => "Bee",

    }
  )
  barry_bee.save()

# barry_bee.first_name = "Leslie"
# barry_bee.last_name = "Nielson"

# barry_bee.update()
# p barry_bee.star.first_name
# p barry_bee.star.last_name
# barry_bee.delete()


casting1 = Casting.new(
  {'movie_id' => bee_movie.id, 'star_id' => barry_bee.id, 'fee' => 25}
)

casting1.save()

bee_movie.stars().each{ |star| puts star.first_name}
