module Trade_Market

  CREDIT_AMOUNT = 100   #I was sure it was 42...

  class User
    attr_accessor :name, :credit_amount, :items

    # @param [String] name
    def initialize(name)
      @name = name
      @credit_amount = CREDIT_AMOUNT
      @items = Array.new
    end

    # @param [String] item_name
    # @param [Float] item_price
    def add_item (item_name, item_price)

      item = TradeItem.new(item_name, item_price, self)
      items.push(item)
    end

    # @param [User] other_user
    def pay_to (other_user)
       #TODO take credit and give credit
    end

    #displays all active items of this user in a String. Returns an Array containing the same items.
    #TODO test
    def display_items_for_sale

      active_items = []
      @items.each do |item|
        if item.status
          puts item.to_s
          active_items.push(item)
        end
      end
    end

    # @param [TradeItem] item
    #TODO biiig test
    def buy_item (item)
      if item == nil
        puts "transaction fail. \n Item '"+ item.name + "does not exist."
      elsif  !item.status
        puts "transaction fail. \n Item '"+ item.name + "is not for sale."
      elsif  item.price > self.credit_amount
        puts "transaction fail. \n "+ self.name + "has not enough credit."
      else
        pay_to(item.owner)
        item.new_owner (self)
      end
    end

  end # class: User

end
