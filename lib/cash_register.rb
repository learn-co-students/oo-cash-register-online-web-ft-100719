class CashRegister

  attr_accessor :total, :discount, :items, :final_total, :prev_items
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @final_total = self.total
    @prev_items = self.items
    self.total += price * quantity
    self.items.concat(Array.new(quantity, title))
  end

  def apply_discount
    self.total *= (1 - (self.discount.to_f / 100))
    self.discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{self.total.to_i}."
  end

  def void_last_transaction
    self.total = self.final_total
    @items = self.prev_items
  end

end
