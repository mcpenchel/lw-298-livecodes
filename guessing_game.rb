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

min = 0
max = 5000000

rng = (min..max).to_a.sample

while true
  counter += 1
  puts "#{counter} attempt(s)"

  guess = ((max + min) / 2).round

  if guess == rng
    puts "Congrats! The number is #{rng}"
    break
  else
    if guess > rng
      max = guess
    else
      min = guess
    end
  end
end
