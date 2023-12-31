require 'minitest/autorun'
require 'minitest/focus'
require_relative 'poker'

class PokerTest < Minitest::Test
  def test_raises_when_not_enough_cards
    assert_raises Hand::InvalidHandError do
      Hand.new('Jc Qh 9s 2h')
    end
  end

  def test_raises_when_a_card_does_not_exist
    assert_raises Hand::InvalidHandError do
      Hand.new('Jc Qh 9s 2h 3x')
    end
  end

  def test_hand_with_nothing
    assert_equal :nothing, Hand.new('Jc Qh 9s 2h 3d').name
    assert_equal :nothing, Hand.new('Tc 8s 7c 4d 2s').name
  end

  def test_hand_with_a_pair
    assert_equal :pair, Hand.new('Jc Qh Js 2h 3d').name
    assert_equal :pair, Hand.new('7h 9c 8c 2d 8s').name
  end

  def test_hand_with_two_pairs
    assert_equal :two_pairs, Hand.new('Jc Qh Js Qs 3d').name
    assert_equal :two_pairs, Hand.new('9c 8h 8s Qs 9d').name
  end

  def test_hand_with_three_of_a_kind
    assert_equal :three_of_a_kind, Hand.new('Jc Qh 9s Jh Jd').name
    assert_equal :three_of_a_kind, Hand.new('Ts Tc 5s 7h Td').name
  end

  def test_hand_with_straight
    assert_equal :straight, Hand.new('6c 5h 4s 2h 3d').name
    assert_equal :straight, Hand.new('Ts 8c 9h 6d 7s').name
  end

  def test_hand_with_flush
    assert_equal :flush, Hand.new('Jd Qd 9d 2d 3d').name
    assert_equal :flush, Hand.new('Ts 7s 4s 6s 9s').name
  end

  def test_hand_with_full_house
    assert_equal :full_house, Hand.new('Jc Qh Js Jh Qd').name
    assert_equal :full_house, Hand.new('8c Th Ts 8h 8d').name
  end

  def test_hand_four_of_a_kind
    assert_equal :four_of_a_kind, Hand.new('Jc Jh Js 2h Jd').name
    assert_equal :four_of_a_kind, Hand.new('Qs Qh Js Qc Qd').name
  end

  def test_hand_straight_flush
    assert_equal :straight_flush, Hand.new('Jd Qd 9d Td 8d').name
    assert_equal :straight_flush, Hand.new('Ts Js 8s 9s 7s').name
  end

  def test_hand_royal_flush
    assert_equal :royal_flush, Hand.new('Jd Qd Kd Td Ad').name
    assert_equal :royal_flush, Hand.new('Js Qs Ks Ts As').name
  end

  def test_poker_p1_wins_with_pair
    p1 = { player: 'John', hand: 'Jc 3h Qs 2h Jd' }
    p2 = { player: 'Sam', hand: 'Js Qh 9s 2s 3d' }
    assert_equal 'John wins with pair', Poker.winner(p1, p2)
  end

  def test_poker_p2_wins_with_three_of_a_kind
    p1 = { player: 'John', hand: 'Jc 3h Qs 2h Jd' }
    p2 = { player: 'Sam', hand: '9s Qh 9s 2s 9h' }
    assert_equal 'Sam wins with three_of_a_kind', Poker.winner(p1, p2)
  end

  def test_poker_p2_wins_with_flush
    p1 = { player: 'John', hand: 'Jc 3h Qs 2d Jd' }
    p2 = { player: 'Sam', hand: 'Jh Qh 9h 2h Jh' }
    assert_equal 'Sam wins with flush', Poker.winner(p1, p2)
  end

  def test_poker_p1_wins_with_kicker
    p1 = { player: 'Steeve', hand: 'Jc 3h Qs 2h Jd' }
    p2 = { player: 'Agathe', hand: 'Js Th 9s 2s Jh' }
    assert_equal 'Steeve wins with pair and kicker Q', Poker.winner(p1, p2)
  end

  def test_poker_tie_game
    p1 = { player: 'John', hand: 'Jc 3h Qs 2h Jd' }
    p2 = { player: 'Sam', hand: 'Js Qh 9s 2s Jh' }
    assert_equal 'tie', Poker.winner(p1, p2)
  end
end