ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
deck = []
suits.each do |suit|
    ranks.each do |rank|
        new_card = {
            "rank" => rank,
            "suit" => suit
        }
        deck << new_card
    end
end
