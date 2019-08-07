require_relative "word-frequencies.rb"

#read the file
#assign to a variable
#call the method histogram
#print the result

text_file = File.read("article.txt")
words_frequencies = histogram(text_file)

o_word_frequencies = words_frequencies.sort_by do |word, frequency|
  frequency
end

o_word_frequencies.reverse.each do |key, value|
  puts "#{key} appears #{value} times"
end
