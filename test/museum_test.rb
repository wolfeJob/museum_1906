require './lib/exhibit'
require './lib/patron'
require './lib/museum'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class ExhibitTest < Minitest::Test

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  def test_it_exists
      assert_instance_of Museum, @dmns
  end

  def test_it_has_a_name
    assert_equal "Denver Museum of Nature and Science", @dmns.name
  end

  def test_it_can_have_exhibits
    assert_equal [], @dmns.exhibits
  end

  def test_it_can_add_exhibits
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    @dmns.add_exhibit(gems_and_minerals)
    @dmns.add_exhibit(dead_sea_scrolls)
    @dmns.add_exhibit(imax)

    assert_equal [gems_and_minerals, dead_sea_scrolls, imax], @dmns.exhibits
  end

  def test_can_recommend_interests
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    imax = Exhibit.new("IMAX", 15)
    @dmns.add_exhibit(gems_and_minerals)
    @dmns.add_exhibit(dead_sea_scrolls)
    @dmns.add_exhibit(imax)
    bob = Patron.new("Bob", 20)
    bob.add_interest("Gems and Minerals")
    bob.add_interest("Dead Sea Scrolls")
    sally = Patron.new("Sally", 20)
    sally.add_interest("IMAX")

    assert_equal [dead_sea_scrolls, gems_and_minerals],@dmns.recommend_exhibits(bob)
    assert_equal [imax], @dmns.recommend_exhibits(sally)
  end


end
