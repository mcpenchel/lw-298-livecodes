# create 3 options
# code the game rulez
# ask for our input
# computer randomly chosing between 3 options
# check and return the answer(winner)

jokenpo = ["rock", "scissor", "paper"]

def the_game(player_choice, computer_choice)
  # draw
  # return "draw" if player_choice == computer_choice

  if player_choice == "rock" && computer_choice == "scissor"
    return "You win because computer choose #{computer_choice}"
  elsif player_choice == "paper" && computer_choice == "rock"
    return "You win because computer choose #{computer_choice}"
  elsif player_choice == "scissor" && computer_choice == "paper"
    return "You win because computer choose #{computer_choice}"
  else
    return "You luuuze... The computer choose #{computer_choice}"
  end
end

puts "Choose between rock, scissor, and paper:"
player_choice = gets.chomp
computer_choice = jokenpo.sample


while player_choice == computer_choice
  puts "Ops!! its a draw.. choose again, chooose wisely..."
  player_choice = gets.chomp
  computer_choice = jokenpo.sample

  puts the_game(player_choice, computer_choice)

end
