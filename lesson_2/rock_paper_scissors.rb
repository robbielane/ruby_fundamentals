
VALID_CHOICES = %w(rock paper scissors lizard spock)
player_score = 0
computer_score = 0

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
  while computer_score <= 4 && player_score <= 4
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

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    else
      player_score += 0
      computer_score += 0
    end

    puts("\n-------------Score-------------")
    puts("You: #{player_score} \nComputer: #{computer_score}")

    if computer_score == 5
      prompt("COMPUTER WINS!!!")
    elsif player_score == 5
      prompt("YOU WIN!!!")
    end
  end
  computer_score = 0
  player_score = 0
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing! Good bye")
