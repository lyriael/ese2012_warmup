module Trade_Market

  CREDIT_AMOUNT = 100

  class User
    attr_accessor :name, :credit_amount, :items

    # @param [String] name
    def initialize(name)
      @name = name
      @credit_amount = CREDIT_AMOUNT
      @items = Hash.new
    end

    # @param [String] item_name
    # @param [Float] item_price
    def add_new(item_name, item_price)

      item = TradeItem.new(item_name, item_price, self)
      items.push(item)
    end

    def add(item)
      if items.has_key?(item.name)
        puts "An item with name #{item.name} is already present. Choose a different name."
      else
        items[item.name] = item
      end
    end

    # @param [TradeItem] item
    def remove(item)
      items.delete(item.name)
    end

    #displays all active items of this user in a String. Returns an Array containing the same items.
    def items_for_sale
      active_items = Hash.new
      @items.each do |item|
        if item.status
          active_items[item.name] = item
        end
      end
      active_items
    end

    # @param [TradeItem] item
    #TODO biiig test
    def buy_item (item)
      if item == nil
        puts "transaction fail. \n Item #{item.name} does not exist."
      elsif  !item.status
        puts "transaction fail. \n Item #{item.name} is not for sale."
      elsif  item.price > self.credit_amount
        puts "transaction fail. \n Item #{item.name} has not enough credit."
      else
        self.pay_for(item)
        item.new_owner(self)
      end
    end

    def pay_for(item)
      self.credit_amount -= item.price
      item.owner += item.price
    end

  end # class: User

end # module: Trade_Market
