
class CashRegister

  attr_accessor :total, :discount, :cart
  
  
  
  def initialize(discount=0)
    @cart = Array.new
    @total = 0
    @discount = discount
  end
  
  def add_item(title, price, quantity = 1)
    i = 0
    @price = price * quantity
    @title = title
    #title, price, adds to total
    #accepts optional quantity
    #includes previous total
    
    while i < quantity
      
      @cart << title
      
      @total += price
      
      i += 1
    end
    
  end
  
  def apply_discount
    if @discount == 20
      @total = @total - (total * (@discount/100.00))
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end
  
  def items
    @cart
  end
  
  def void_last_transaction
    #select the last thing added to the transaction 
    #remove it from the list and remove it from the total
    @total -= @price
    
  end

end