require_relative 'animal'

class Meerkat < Animal
  def talk
    "#{super} barks."
  end
end
