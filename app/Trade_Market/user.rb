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

    #displays all active items of this user in a String. Returns an Array containing the same items.
    def display_items

      active_items = []
      @items.each do |item|
        if item.status
          puts item.to_s
          active_items.push(item)
        end
      end

    end

  end # class: User

end # module
