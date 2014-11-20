class Inventory
  require 'bigdecimal'

  def initialize
    @stock = {}
  end

  def register (product, price)
    raise "This product is already in inventory or price is not correct or name of product size is bigger then 40" if @stock.has_key?(product) or not BigDecimal(price).between? BigDecimal("0.01"), BigDecimal("999.99") or product.size > 40
    @stock.merge! product => BigDecimal(price)
  end

  def new_cart
    Cart.new
  end
end

class Cart
  def initialize
    @products = {}
  end

  def add (product, count)
    @products.merge! product => count
  end
end

inventory = Inventory.new
#inventory.register 'Green Tea', '1.99'
inventory.register 'Green Tea', "1.99"
cart = inventory.new_cart
#p inventory
cart.add 'Green Tea', 1
cart.add 'Red Tea', 2
cart.add 'Green Tea', 2
p cart