# define the method
# create an array with the alphabet
# find the index of each caracter
# create the rule that reassigns tha caracter (-3)
# apply that rule unless it is a space
# return the result

def encrypt(sentence)
  return "" if sentence == ""
  alphabet = ("A".."Z").to_a
  answer = ""
  sentence.each_char do |caracter|
    if caracter == " "
      answer += " "
    else
      caracter_index = alphabet.index(caracter)
      answer += alphabet[caracter_index-3]
    end
  end
  return answer
end

puts encrypt("D")


describe '#encrypt' do
  it "returns an empty string if received an empty string" do
    expect(encrypt("")).to eq("")
  end

  it "encrypts the message correctly" do
    phrase = "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG"
    actual_encryption = encrypt(phrase)
    real_encryption = "QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD"

    expect(actual_encryption).to eq(real_encryption)
  end
end
