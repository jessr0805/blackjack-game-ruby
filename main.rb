player_busted = false
ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
deck = []
player_hand = []
dealer_hand = []
rank_value = {
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "10" => 10,
    "Jack" => 10,
    "Queen" => 10,
    "King" => 10,
    "Ace" => 11
}
suits.each do |suit|
    ranks.each do |rank|
        new_card = {
            "rank" => rank,
            "suit" => suit
        }
        deck << new_card
    end
end
shuffled_deck = deck.shuffle
card_dealt = shuffled_deck.pop
player_hand << card_dealt
card_dealt = shuffled_deck.pop
dealer_hand << card_dealt
card_dealt = shuffled_deck.pop
player_hand << card_dealt
card_dealt = shuffled_deck.pop
dealer_hand << card_dealt
puts "Player's hand: #{player_hand}"
puts "Dealer's hand: #{dealer_hand}"
total_rank_value_player = 0
player_hand.each do |card|
    puts "Player card rank: #{card["rank"]}"
    rank_value_player = rank_value[card["rank"]]
    total_rank_value_player += rank_value_player
end
total_rank_value_dealer = 0
dealer_hand.each do |card|
    puts "Dealer card rank: #{card["rank"]}"
    rank_value_dealer = rank_value[card["rank"]]
    total_rank_value_dealer += rank_value_dealer
end
puts "Player's card value: #{total_rank_value_player}"
puts "Dealer's card value: #{total_rank_value_dealer}"
if total_rank_value_player <= 21
    puts "Player's hand: #{player_hand}"
    puts "Player's card value: #{total_rank_value_player}"
    print "\nWould you like to stand or hit? "
    player_response = gets.chomp.downcase
else
    puts "Sorry, but you busted!"
    player_response = "stand"
    player_busted = true
end
until player_response == "stand"
    card_dealt = shuffled_deck.pop
    player_hand << card_dealt
    rank_value_player = rank_value[card_dealt["rank"]]
    total_rank_value_player += rank_value_player
    if total_rank_value_player <= 21
        puts "Player's hand: #{player_hand}"
        puts "Player's card value: #{total_rank_value_player}"
        print "\nWould you like to stand or hit? "
        player_response = gets.chomp.downcase
        player_busted = false
    else
        puts "Sorry, but you busted!"
        player_busted = true
        break
    end
end
if player_busted == false
    puts "Dealer's Turn"
    until total_rank_value_dealer >= 17
        card_dealt = shuffled_deck.pop
        dealer_hand << card_dealt
        rank_value_dealer = rank_value[card_dealt["rank"]]
        total_rank_value_dealer += rank_value_dealer
    end
    puts "Dealer's hand: #{dealer_hand}"
    if total_rank_value_dealer <= 21
        puts "The dealer did not bust. Dealer's card value: #{total_rank_value_dealer}"
    else   
        puts "The dealer busted. Dealer's card value: #{total_rank_value_dealer}"
    end
    puts "Your card value: #{total_rank_value_player}"
end