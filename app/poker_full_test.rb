require 'minitest/autorun'
require 'minitest/focus'
require_relative 'poker'

class PokerTest < Minitest::Test
  def test_raises_when_not_enough_cards
    assert_raises Hand::InvalidHandError do
      Hand.new('Jc Qh 9s 2h')
    end
  end
end