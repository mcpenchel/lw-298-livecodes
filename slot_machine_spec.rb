require_relative 'slot_machine'

def test_exact_reel_combination(reel, score)
  slot_machine = SlotMachine.new

  it "returns #{score} when we have 3 #{reel}" do
    expect(slot_machine.score([reel, reel, reel].sort)).to eq(score)
  end
end

def test_two_reel_combination(reel, lone_reel, score)
  slot_machine = SlotMachine.new

  it "returns #{score} when we have 2 #{reel} and 1 #{lone_reel}" do
    expect(slot_machine.score([reel, reel, lone_reel].sort)).to eq(score)
  end
end

describe SlotMachine do
  describe '#score' do
    test_exact_reel_combination("Joker", 50)
    test_exact_reel_combination("Star", 40)
    test_exact_reel_combination("Bell", 30)
    test_exact_reel_combination("Seven", 20)
    test_exact_reel_combination("Cherry", 10)

    test_two_reel_combination("Star", "Joker", 20)
    test_two_reel_combination("Bell", "Joker", 15)
    test_two_reel_combination("Seven", "Joker", 10)
    test_two_reel_combination("Cherry", "Joker", 5)

    test_two_reel_combination("Joker", "Star", 25)
    test_two_reel_combination("Joker", "Bell", 25)
    test_two_reel_combination("Joker", "Seven", 25)
    test_two_reel_combination("Joker", "Cherry", 25)

    it "returns ZERO if three different ones" do
      slot_machine = SlotMachine.new

      expect(slot_machine.score(["Cherry", "Bell", "Joker"].sort)).to eq(0)
    end
  end
end

