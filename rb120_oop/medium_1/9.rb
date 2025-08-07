class Card
  include Comparable

  RANK_VALUES = {
    'Jack' => 11,
    'Queen' => 12,
    'King' => 13,
    'Ace' => 14
  }
  
  SUIT_VALUES = {
    'Diamonds' => 1,
    'Clubs' => 2,
    'Hearts' => 3,
    'Spades' => 4
  }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def suit_value
    SUIT_VALUES.fetch(suit)
  end

  def rank_value
    RANK_VALUES.fetch(rank, rank)
  end

  def <=>(other)
    (self.rank == other.rank) ? (self.suit_value <=> other.suit_value) : (self.rank_value <=> other.rank_value)
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck = []
    reset
  end
  
  def reset
    generate_cards
    @deck.shuffle!
  end

  def generate_cards
    RANKS.each do |rank|
      SUITS.each do |suit|
        @deck << Card.new(rank, suit)
      end
    end
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.