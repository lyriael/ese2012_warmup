require "test/unit"
require "../app/Trade_Market/user"

class UserTest   < Test::Unit::TestCase

  def test_should_have_name
    user = Trade_Market::user.new('Schmendrick')
    assert(user.name == 'Harry', 'User should have name \'John\' but was \'' + user.name + '\'')
  end

  def test_should_have_100_credits
    user = Trade_Market::user.new('Schmendrick')
    assert(user.credit_amount == 100, 'User should have an initial credit amount of \' 100 \' but has \'' + user.credit_amount + '\'')
  end

  def test_should_have_items_list
    user = Trade_Market::user.new('Schmendrick')
    puts user.items.to_s
    asser(user.items != nil, 'User should have an initialized array, but array is \' nil \'')
  end

  def test_should_have_no_item_yet
    user = Trade_Market::user.new('Schmendrick')
    asser(user.items.size == 0, 'User should have no items yet, but array contains' + user.items.size + 'items: ' +user.items.to_s)
  end

  def test_to_test
    asser(2 != 2)
  end
end