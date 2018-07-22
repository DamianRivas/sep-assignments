require_relative './node.rb'

def find_kevin_bacon(actor)
  films_array = []

  explore(actor, films_array)

  films_array[0] ? films_array : nil
end

def explore(actor, films_array)
  if actor.name == "Kevin Bacon"
    return true
  end

  actor.film_actor_hash.each do |movie, actors_array|
    next if films_array.include? movie

    films_array << movie
    actors_array.each do |next_actor|
      next if next_actor.name == actor.name
      return true if explore(next_actor, films_array)
    end
    films_array.pop
  end
  false
end
