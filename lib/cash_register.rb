class CashRegister
  attr_accessor :total, :discount, :items, :transactions

  def initialize(discount = 0)
    self.total = 0
    self.discount = discount
    self.items = []
    self.transactions = []
    self
  end

  def add_item(title, price, quantity = 1)
    self.total = ( price * quantity ) + self.total
    quantity.times { self.items << title }
    self.transactions << {
      title: title,
      price: price,
      quantity: quantity
    }

  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total =  self.total * ((100.0 - self.discount) / 100.0)
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end
  def void_last_transaction
    last_transaction =  self.transactions.pop
    if transactions == []
      self.items.clear
      self.total = 0
    else
      last_transaction[:quantity].times{self.items.pop}
      self.total = self.total - ( last_transaction[:price] * last_transaction[:quantity] )
    end
  end
end
