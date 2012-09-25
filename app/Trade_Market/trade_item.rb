module Trade_Market

  class TradeItem

    attr_accessor :name, :price, :status, :owner

# :doc:
# @param [String] name
# @param [Float] price
# @param [User] owner
    def initialize(name, price, owner)
      @name = name
      @price = price
      @owner = owner
      self.inactivate

    end

# Activates item to put it
# to the list of selling
# items.
    def activate
      @status = true
    end

    def inactivate
      @status = false
    end

    # @param [User] n_owner
    def new_owner(n_owner)
      owner.items.remove(self)
      n_owner.add(self)
      owner = n_owner
    end

  end

end

