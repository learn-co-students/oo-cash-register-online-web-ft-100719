class CashRegister
  attr_accessor :total, :discount, :items, :last_trans_amt
  
  def initialize(discount= 0) 
    @total = 0
    @discount = discount
    @items = []
  end
  def add_item(title, price, quantity= 1)
    
     @total += (price * quantity)
     
     quantity.times{@items << title}
     @last_trans_amt = price * quantity
  end
  
  def apply_discount
    if @discount != 0 
      @total = @total - (@total * (@discount / 100.00))
    return "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
    end
    
  def items 
    @items
  end 
  def void_last_transaction
    @total -= @last_trans_amt
  end
end
