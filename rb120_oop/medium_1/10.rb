# ==========================
# CARD CLASS

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

# ==========================
# DECK CLASS

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


# ==========================
# POKERHAND CLASS

class PokerHand
  def initialize(deck)
    @deck = deck
    @hand = []
    5.times { @hand << @deck.draw }
  end

  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  attr_reader :deck, :hand

  def royal_flush?
    straight_flush? && hand.map(&:rank_value).sort == Array(10..14)
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    hand_rank_frequencies.max == 4
  end
  
  def hand_rank_frequencies
    freq = Hash.new(0)
    hand.each { |card| freq[card.rank_value] += 1 }
    freq.values.sort
  end

  def full_house?
    hand_rank_frequencies == [2, 3]
  end

  def flush?
    hand.map(&:suit_value).uniq.size == 1
  end

  def straight?
    return false unless hand_rank_frequencies == [1, 1, 1, 1, 1]
    hand_rank_values = hand.map(&:rank_value)
    return true if hand_rank_values.max - hand_rank_values.min == 4
    change_ace_to_low(hand_rank_values)
    (hand_rank_values.max - hand_rank_values.min) == 4
  end

  def change_ace_to_low(hand_rank_values)
    hand_rank_values.map! { |value| value == 14 ? 1 : value }
  end

  def three_of_a_kind?
    hand_rank_frequencies == [1, 1, 3]
  end

  def two_pair?
    hand_rank_frequencies == [1, 2, 2]
  end

  def pair?
    hand_rank_frequencies == [1, 1, 1, 2]
  end
end

# =======================
# TEST CASES

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'