# define method acronym
# receive sentence take first letter of each word
# capitalize each letter
# concatenate and return the acronym
def acronym(sentence)
  return "" if sentence == ""

  answer = ""
  words = sentence.split

  words.each do |word|
    answer += word[0].capitalize
  end

  answer
end

puts acronym("Not safe for work") == "NSFW"
puts acronym("") == ""
puts acronym("").class == String

