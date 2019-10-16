class CashRegister 
  attr_accessor :total, :last_transaction_item, :last_transaction_total, :discount, :items 
  
  def initialize(discount=0)
    self.total = 0 
    self.discount = discount
    self.items = []
  end 
  
  def add_item(item, price, quantity=1)
    self.total += (price * quantity)
    quantity.times do 
      items << item 
    end 
    self.last_transaction_total = price * quantity 
    self.last_transaction_item = item
  end 
  
  def apply_discount
    if discount != 0 
      self.total = self.total - (self.total * self.discount/100)
      return "After the discount, the total comes to $#{self.total}."
    end 
    return "There is no discount to apply."
  end 
  
  def void_last_transaction 
    self.total = self.total - self.last_transaction_total
    self.items.delete_if{|item| item == self.last_transaction_item}
    return self.total.to_f
  end 
end 