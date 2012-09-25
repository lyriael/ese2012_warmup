require 'test/unit'
require '../app/Trade_Market/trade_item'
require '../app/Trade_Market/user'

class TradeItemTest < Test::Unit::TestCase

  def test_should_create_item
    item = Trade_Market::TradeItem.new('sand', 100, nil)
    assert(item != nil, 'Item should be created')
  end
  #Test doesn't work with 'create' but it does with 'new', why?
  #Because you didn't define a method create :) Looks like
  #new is a constructor defined automatically.


  def test_should_have_price
    item = Trade_Market::TradeItem.new('sand', 100, nil)
    assert(item.price == 100, "Price should be 100 credits, but is \'#{item.price}\'")
  end

  def test_should_have_name
    item = Trade_Market::TradeItem.new('john', 100, nil)
    assert(item.name == 'john', 'Item should be called \'john\'')
  end

  def test_should_be_inactive_init
    item = Trade_Market::TradeItem.new('Spoon', 5, nil)
    assert(!item.status,"Status should be inactive on init, but was activ.")
  end

  def test_should_be_active
    item = Trade_Market::TradeItem.new('Hitchhikers guide to the universe', 42, nil)
    item.activate
    assert(item.status, "Status should be active after invoking \'activate\'")
  end

  def test_should_have_owner
    user = Trade_Market::User.new('Lord Darth Vader')
    item = Trade_Market::TradeItem.new('Death Star', 75, user)
    assert(item.owner == user, "Owner of #{item} should be \'Lord Darth Vader\' but was #{user.name}")
  end
end