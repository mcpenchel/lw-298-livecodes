require_relative "../animal"

describe Animal do
  describe '.initialize' do
    it "receives a name" do
      expect(Animal.new("Simba").class).to eq(Animal)
    end
  end

  describe '#name' do
    it "returns the given name when initializing the object" do
      simba = Animal.new("Simba")
      expect(simba.name).to eq("Simba")
    end
  end

  describe '#talk' do
    it "returns the correct way of talking for that animal" do
      expect(Animal.new("Simba").talk).to eq("Simba")
    end
  end

  describe '.phyla' do
    it "returns the correct list of phylas" do
      phylas = ["Ecdysozoa", "Lophotrochozoa", "Radiata", "Deuterostomia"].sort
      actual_phylas = Animal.phyla.sort
      expect(phylas).to eq(actual_phylas)
    end
  end

  describe '#eat' do
    it "returns the eating sentence" do
      new_animal = Animal.new("Shark")
      expect(new_animal.eat("turtle")).to eq("Shark eats a turtle")
    end
  end
end
