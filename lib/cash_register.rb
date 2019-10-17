class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction_amount
  
  def initialize(discount=0)
    self.total = 0
    self.discount = discount
    self.items = []
  end
  
  def add_item(title, price, quantity=1)
    self.last_transaction_amount = price * quantity
    self.total += self.last_transaction_amount
    quantity.times { self.items.push(title) }
  end
  
  def apply_discount
    if self.discount != 0
      self.total = self.total - (self.total * (self.discount/100.0))
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    self.total -= self.last_transaction_amount
  end
  
end # end of CashRegister class