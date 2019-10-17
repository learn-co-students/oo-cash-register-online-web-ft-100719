class CashRegister
  attr_accessor :total, :discount, :last_total, :items
  
  
  
  def initialize(discount = 0)
    @discount = discount
    @total = 0.0
    @items = []
  end
  
  def add_item(item_name, price, quantity = 1)
    @last_total = @total
    @total += (price*quantity)
    quantity.times do
      @items << item_name
    end
    
  end
  
  def apply_discount
    self.total = self.total - self.total*(@discount/100.0)
    @discount == 0? "There is no discount to apply." :  "After the discount, the total comes to $#{@total.to_i}." 
  end
  
  def void_last_transaction
    self.total = self.last_total
  end
  
end
