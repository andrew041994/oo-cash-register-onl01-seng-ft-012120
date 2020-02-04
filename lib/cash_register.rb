
class CashRegister
  attr_accessor :total, :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @@items = []
  end

  def add_item(title,price, quantity=1)
    self.total += price * quantity
    quantity.times {@@items << title}
    @@transaction = {}
    @@transaction[:title]=price*quantity
  end

  def apply_discount

    if @discount > 0
      @total -= (@discount / 100.to_f * @total).to_i
        "After the discount, the total comes to $#{@total}."
    else
       "There is no discount to apply."
    end
  end

  def items
    @@items
  end

  def void_last_transaction

    if @@transaction.size > 0
        @total -= @@transaction[:title]
      elsif @@transactions == 0
          @total
    end
  end
end
