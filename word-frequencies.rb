def histogram(sentence)
  ##create an empty hash
  emptier_hash = {}
  ##transform sentence into an array
  sentence = sentence.gsub(",", "").gsub(".", "")
  sentence = sentence.gsub(":", "").gsub("\"", "")
  sentence = sentence.gsub("\n", "")

  array_sentence = sentence.split
  ### loop through array
  array_sentence.each do |word|
  ### if key exist then add one to the value
    if emptier_hash.key?(word)
      emptier_hash[word] += 1
      ### else create one
    else
      emptier_hash[word] = 1
    end
  end
  ## return hash
  return emptier_hash
end



# describe "#histogram" do
#   it "returns an empty string if given an empty string" do
#     expect(histogram("")).to eq({})
#   end

#   it "returns the correct word frequencies" do
#     phrase = "crazy mastodon killed the crazy rabbit"
#     word_frequencies = histogram(phrase)

#     # {
#     #   "crazy" => 2,
#     #   "mastodon" => 1,
#     #   "rabbit" => 1,
#     #   ... so forth
#     # }

#     expect(word_frequencies["crazy"]).to eq(2)
#     expect(word_frequencies["mastodon"]).to eq(1)
#     expect(word_frequencies["rabbit"]).to eq(1)
#   end
# end
