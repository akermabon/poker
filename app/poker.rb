require 'pry-byebug'

SUITS = %w(c h d s).freeze
RANKS = %w(2 3 4 5 6 7 8 9 T J Q K A).freeze
HANDS = %i(nothing pair two_pairs three_of_a_kind straight flush full_house four_of_a_kind straight_flush royal_flush).freeze

class Poker
  def self.winner(p1, p2)
    Poker.new(p1, p2).winner
  end

  def initialize(p1, p2)
    @p1 = Hand.new(p1[:hand], p1[:player])
    @p2 = Hand.new(p2[:hand], p2[:player])
  end

  def winner
    return 'tie' if same_hand? && same_kickers?

    best_hand = [@p1, @p2].max
    string = "#{best_hand.player} wins with #{best_hand.name}"
    if same_hand?
      string += " and kicker #{best_hand.kicker}"
    end
    string
  end

  def same_hand?
    @p2.name == @p1.name
  end

  def same_kickers?
    @p1.kicker == @p2.kicker
  end
end

class Hand
  attr_reader :player

  def initialize(cards_string, player = nil)
    @cards = cards_string.split(' ')
    @player = player
    check_cards!
  end

  def name
    return :royal_flush if royal_flush?
    return :straight_flush if straight_flush?
    return :four_of_a_kind if four_of_a_kind?
    return :full_house if full_house?
    return :flush if flush?
    return :straight if straight?
    return :three_of_a_kind if three_of_a_kind?
    return :two_pairs if two_pairs?
    return :pair if pair?
    :nothing
  end

  def ==(other)
    HANDS.index(name) == HANDS.index(other.name)
  end

  def <=>(other)
    return HANDS.index(name) <=> HANDS.index(other.name) if self != other
    RANKS.index(kicker) <=> RANKS.index(other.kicker)
  end

  def kicker
    ranks.sort_by { |head| RANKS.index(head) }.last
  end

  class InvalidHandError < StandardError
  end

  private

  def check_cards!
    raise InvalidHandError if @cards.count != 5
    raise InvalidHandError if @cards.any? do |card|
      rank, suit = card.split('')
      !RANKS.include?(rank) || !SUITS.include?(suit)
    end
  end

  def ranks
    @cards.map do |card| card[0] end
  end

  def suits
    @cards.map do |card| card[1] end
  end

  def pair?
    ranks_counts.count(2) == 1
  end

  def two_pairs?
    ranks_counts.count(2) == 2
  end

  def three_of_a_kind?
    ranks_counts.count(3) == 1
  end

  def straight?
    sorted_ranks = ranks.sort_by { |item| RANKS.index(item) }
    RANKS.join('').include?(sorted_ranks.join(''))
  end

  def ranks_counts
    ranks.tally.values
  end

  def flush?
    suits.uniq.count == 1
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def four_of_a_kind?
    ranks_counts.count(4) == 1
  end

  def straight_flush?
    straight? && flush?
  end

  def royal_flush?
    straight_flush? && ranks.include?('A')
  end
end