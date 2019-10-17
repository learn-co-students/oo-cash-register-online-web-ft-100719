class CashRegister
  attr_accessor :discount, :items, :total, :transactions
  
  
  def initialize(discount=0)
    @total = 0 
    @cart = {}
    @discount = discount
    @items = []
    @transactions = []
  end #initialize
  
  def add_item(title, price, qty = 1)
    item_total = price * qty 
    @total += item_total
    qty.times {@items << title}
    this_transaction = {item: title, price: price, qty: qty, item_total: item_total}
    @transactions << this_transaction
  end #add_item
  
  
  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else 
      @total = (1 - @discount.fdiv(100)) * @total
      "After the discount, the total comes to $#{@total.to_i}."
    end
    
  end
  
  
  
  def void_last_transaction
    
    last_transaction = @transactions.pop
    @total -= last_transaction[:item_total]
    last_transaction[:qty].times { @items.pop }
    
  end #void_last_transaction
end

