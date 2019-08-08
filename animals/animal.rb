class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def talk
    "#{@name}"
  end

  def self.phyla
    ["Ecdysozoa", "Lophotrochozoa", "Radiata", "Deuterostomia"]
  end

  def eat(food)
    return "#{@name} eats a #{food}"
  end
end
