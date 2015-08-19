require 'pry'

def initialize_deck
  cards = []
  ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  suits = %w(S H C D)

  suits.each do |suit|
    ranks.each do |i|
      cards << [suit, i]
    end
  end
  cards
end

def shuffle!(dck)
  dck.shuffle!
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def display_cards(cards)
  values = cards.map { |card| card[1]}
  values[-1] = "and #{values.last}" if values.size > 1
  values.join(', ')
end

def busted?(cards)
  bust = total(cards)
  if bust > 21
    return true
  end
end

deck = initialize_deck
player_cards = []
dealer_cards = []

shuffle!(deck)

# Initial Deal
2.times do
  player_cards << deck.pop
  dealer_cards << deck.pop
end

puts "Dealer has: #{dealer_cards[1][1]} and unknown card"
puts "You have: #{player_cards[0][1]} and #{player_cards[1][1]}"

#======Player Turn======
loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted?(player_cards)
  player_cards << deck.pop if answer.start_with?('h')
  puts "Your cards: #{display_cards(player_cards)}"
  break if busted?(player_cards)
end

if busted?(player_cards)
  puts "You busted! -- Play again? (y or n)"
else
  puts "You chose to stay!"
end

# ======Dealer Turn=======
puts "Dealer cards: #{display_cards(dealer_cards)}"
loop do
  if total(dealer_cards) > total(player_cards)
    puts "Dealer wins!"
  else
    dealer_cards << deck.pop
    puts "dealer cards: #{display_cards(dealer_cards)}"
  end
  break if busted?(dealer_cards) || total(dealer_cards) > total(player_cards)
end

if busted?(dealer_cards)
  puts "Dealer busted"
  puts "You Won!!"
end
