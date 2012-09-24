require 'test/unit'
require '../app/Trade_Market/trade_item'

class TradeItemTest < Test::Unit::TestCase

  def test_should_create_item
    item = Trade_Market::TradeItem.new('sand', 100, nil)
    assert(item != nil, 'Item should be created')
  end
  #Test doesn't work with 'create' but it does with 'new', why?


  def test_should_have_price
    item = Trade_Market::TradeItem.new('sand', 100, nil)
    assert(item.price == 100, 'Price should be 100 credits')
  end

  def test_should_have_name
    item = Trade_Market::TradeItem.new('john', 100, nil)
    assert(item.name == 'john', 'Item should be called \'john\'')
  end

  def test_should_have_nice_to_s
    item = Trade_Market::TradeItem.new('Bamboo', 42, nil)
    assert(item.to_s == "Bamboo costs 42 credits")
  end

  def test_should_have_owner
    #Not yet implemented because User doesn't exist (yet).
  end
end