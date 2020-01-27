class Transaction
  
  attr_reader :type, :time, :amount

  def initialize(type, time = Time.new.strftime('%d-%m-%Y'), amount)
    @type = type
    @time = time
    @amount = amount
  end

  def create_transaction
    [@type, @time, @amount]
  end

end
