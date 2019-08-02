
#define method acronym
# receive sentence take first letter of each word
# capitalize each letter
# concatenate and return the acronym
def acronym(sentence)
  return "" if sentence == ""
  new_sentence = sentence.split.map { |palabras| palabras[0].upcase }
  new_sentence.join
end



describe '#acronym' do
  it "returns an empty string if we send an empty string" do
    expect(acronym("")).to eq("")
  end

  it "returns the 1st letter of each word upcased" do
    expect(acronym("Not safe for work")).to eq("NSFW")
  end
end
