module Trade_Market

  CREDIT_AMOUNT = 100   #I was sure it was 42...

  class User
    attr_accessor :name, :credit_amount, :items

    # @param [String] name
    def initialize (name)
      @name = name
      @credit_amount = CREDIT_AMOUNT
      self.items = Array.new
    end

    def add_item (item_name, item_price)
      item = Item.new(item_name, item_price, self)

      items.push(item)
    end

  end

end
