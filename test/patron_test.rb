require './lib/exhibit'
require './lib/patron'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class PatronTest < Minitest::Test

  def setup
    @bob = Patron.new("Bob", 20)
  end

  def test_it_exists
      assert_instance_of Patron, @bob
  end

  def test_it_has_a_name
    assert_equal "Bob", @bob.name
  end

  def test_it_has_spending_money
    assert_equal 20, @bob.spending_money
  end

  def test_it_can_have_interests
    assert_equal [], @bob.interests
  end

  def test_it_can_add_interests
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Gems and Minerals")
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], @bob.interests
  end


end
