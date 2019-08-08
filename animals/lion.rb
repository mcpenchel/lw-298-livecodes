require_relative 'animal'

class Lion < Animal
  def talk
    "#{super} roars."
  end

  def eat(food)
    "#{super(food)}. Law of the Jungle!"
  end
end

