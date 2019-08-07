require_relative "citizen"

describe Citizen do

  describe '#can_vote?' do
    it "returns false if age < 18" do
      younger_matt = Citizen.new("Matt", "Penchel", 16)
      expect(younger_matt.can_vote?).to eq(false)
    end

    it "returns true if age >= 18" do
      current_matt = Citizen.new("Matt", "Penchel", 18)
      expect(current_matt.can_vote?).to eq(true)
    end
  end

  describe '#full_name' do
    it "returns a pretty full name" do
      kid_matt = Citizen.new("mAtHeUs", "penchEL", 7)
      expect(kid_matt.full_name).to eq("Matheus Penchel")
    end
  end

end
