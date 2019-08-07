RESULTS = ["Cherry", "Seven", "Bell", "Star", "Joker"]

class SlotMachine
  def score(reels)
    if reels.uniq.size == 3
      0
    elsif reels.uniq.size == 2
      if reels.include?("Joker")
        double_reel = reels.detect{ |e| reels.count(e) > 1 }
        (RESULTS.index(double_reel)+1)*5
      else
        0
      end
    else
      # All equals
      (RESULTS.index(reels[0])+1)*10
    end
  end
end
