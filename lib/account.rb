class Account

  def initialize(name)
    @name = name
    @balance = 0
  end

  def update_balance(transaction)
    transaction.type == 'deposit' ? @balance += transaction.amount : @balance -= transaction.amount
  end

  def display_balance
    @balance
  end

end
