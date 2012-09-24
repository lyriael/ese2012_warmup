module Trade_Market

  class TradeItem

    attr_accessor :name, :price, :status, :owner

# @param [String] name
# @param [Float] price
# @param [User] owner
    def initialize(name, price, owner)
      @name = name
      @price = price
      @owner = owner
      self.inactivate

    end

    def activate
      @status = true
    end

    def inactivate
      @status = false
    end

  end

end

