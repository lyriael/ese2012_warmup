require 'test/unit'
require '../app/Trade_Market/trade_item'

class TradeItemTest < Test::Unit::TestCase

  def test_should_create_item
    item = Trade_Market::TradeItem.create('sand', 100, nil)
    assert(item != nil, 'Item should be created')
  end

  def test_should_have_price
    item = Trade_Market::TradeItem.create('sand', 100, nil)
    assert(item.price == 100, 'Price should be 100 credits')
  end

  def test_should_have_name
    item = Trade_Market::TradeItem.create('john', 100, nil)
    assert(item.name == 'sand', 'Item should be called \'sand\'')
  end

  def test_should_have_owner
    #Not yet implemented because User doesn't exist (yet).
  end
end