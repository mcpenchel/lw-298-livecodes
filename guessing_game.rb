=begin

  add counter

  ask for input
  generate random number
  check if input == random number

  show counter
  if correct
    congrats
    end it
  else
    guess another number with a tip

=end

counter = 0

rng = (0..100).to_a.sample

while true
  counter += 1
  puts "Guess a number between 0 and 100"
  input = gets.chomp.to_i

  if counter > 50
    puts "BOO! You have #{counter} attempts."
  else
    puts "You have #{counter} attempts."
  end

  if input == rng
    puts "Congrats!"
    break
  else
    # condition ? true : false
    puts "You're wrong! Try again! you're a baby unicorn"
    if input > rng
      puts "The right number is smaller"
    else
      puts "The right number is bigger"
    end
  end
end
