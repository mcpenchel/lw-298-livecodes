require_relative "../lion"

describe Lion do
  describe '#talk' do
    it "roars" do
      simba = Lion.new("Simba")
      expect(simba.talk).to eq("Simba roars.")
    end
  end

  describe '#eat' do
    it "eats and shows off" do
      simba = Lion.new("Simba")
      expect(simba.eat("gazelle")).to eq("Simba eats a gazelle. Law of the Jungle!")
    end
  end
end
