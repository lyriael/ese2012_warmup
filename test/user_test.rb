require 'test/unit'
require '../app/Trade_Market/user'
require '../app/Trade_Market/trade_item'

class UserTest   < Test::Unit::TestCase

  def should_create_user
    user = Trade_Market::User.new('Schmendrick')
    assert(user != nil)
  end

  def test_should_have_name
    user = Trade_Market::User.new('Schmendrick')
    assert(user.name == 'Schmendrick', 'User should have name \'Schmendrick\' but was \'' + user.name + '\'')
  end

  def test_should_have_100_credits
    user = Trade_Market::User.new('Schmendrick')
    assert(user.credit_amount == 100.to_f, 'User should have an initial credit amount of \' 100 \' but has \'' + user.credit_amount.to_s + '\'')
  end

  def test_should_have_items_list
    user = Trade_Market::User.new('Schmendrick')
    puts user.items.to_s
    assert(user.items != nil, 'User should have an initialized array, but array is \' nil \'')
  end

  def test_should_have_no_item_yet
    user = Trade_Market::User.new('Schmendrick')
    assert(user.items.size == 0, 'User should have no items yet, but array contains' + user.items.size.to_s + 'items: ' +user.items.to_s)
  end

  def test_should_have_item_in_list
    user = Trade_Market::User.new('Schmendrick')
    item = Trade_Market::TradeItem.new('Wand', 45, user)
    assert(user.items.size == 0, "User should have no item yet, but has #{user.items.size.to_s}")
    user.add(item)
    assert(user.items.size == 1, "User should have 1 item, but has #{user.items.size.to_s}")
  end

  def test_should_add_remove_item
    user = Trade_Market::User.new('Schmendrick')
    item_1 = Trade_Market::TradeItem.new('Wand', 45, user)
    item_2 = Trade_Market::TradeItem.new('Hat', 15, user)
    user.add(item_1)
    user.add(item_2)
    assert(user.items.size == 2, "User should have 2 items, but has #{user.items.size.to_s}")
    user.remove(item_1)
    assert(user.items.size == 1, "User should have 1 item, but has #{user.items.size.to_s}")
    user.remove(item_2)
    assert(user.items.size == 0, "User should have no items anymore, but has #{user.items.size.to_s}")
  end


end