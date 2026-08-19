ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
deck = []
player_hand = []
dealer_hand = []
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
puts player_hand
puts dealer_hand
