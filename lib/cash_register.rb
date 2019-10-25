# class CashRegister
#     # returns the current total
#     attr_accessor :total, :discount, :last_transaction_amount, :items

#     def initialize(discount = 0) # optionally takes an employee discount on initialization
#         @total = 0 # sets an instance variable @total on initialization to zero
#         @discount = discount
#         @items = []
#     end

#     # accepts a title and a price and increases the total
#     # also accepts an optional quantity
#     def add_item(title, price, quantity = 1)
#         if quantity>1
#             i=0
#             while i<quantity
#                 @items << title
#                 i += 1
#             end
#         else
#             @items << title
#         end
#         @total += price*quantity 
#         @last_transaction_amount = @total
#         @total # doesn't forget the previous total
#     end

#     def apply_discount()
#         if @discount > 0
#             @discount = @discount/100.to_f
#             @total = @total - (@total * (@discount)) # applies the discount to the total price and reduces the total
#             "After the discount, the total comes to $#{total.to_i}." # returns success message with the updated total
#         else
#             "There is no discount to apply." # returns an array containing all items that have been added
#         end
#     end

#     def void_last_transaction()
#         @total = @total - @last_transaction_amount
#     end
    

# end

class CashRegister
    attr_accessor :total, :discount, :quantity, :price
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @price = price
      @quantity = quantity
      @items = []
      @transactions = []
    end
  
    def add_item(title, price, quantity = 1)
      @total += price * quantity
      @transactions << price * quantity
      i = quantity
      until i == 0 do
        @items << title
        i -= 1
      end
    end
  
    def apply_discount
      if @discount == 0
        "There is no discount to apply."
      else
        self.total -= (0.01 * @discount * @total).to_i
        "After the discount, the total comes to $#{self.total}."
      end
    end
  
    def items
        @items
    end
  
    def void_last_transaction
      self.total = @total - @transactions.pop
      
    end
end





















  
