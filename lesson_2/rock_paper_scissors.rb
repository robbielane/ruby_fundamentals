
VALID_CHOICES = %w(rock paper scissors lizard spock)
def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'lizard' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt " Choose one: Rock(r), Paper(p), Scissors(sc), Lizard(l) or Spock(sp)"
    choice = gets.chomp.downcase
    case choice
    when 'r', 'rock'
      choice = 'rock'
      break
    when 'p', 'paper'
      choice = 'paper'
      break
    when 'sc', 'scissors'
      choice = 'scissors'
      break
    when 'l', 'lizard'
      choice = 'lizard'
      break
    when 'sp', 'spock'
      choice = 'spock'
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing! Good bye")
