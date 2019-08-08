require_relative 'animal'

class Warthog < Animal
  def talk
    "#{super} grunts."
  end
end
