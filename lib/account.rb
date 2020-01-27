class Account

  def initialize(name)
    @name = name
  end

  def update_balance(transaction)
    transaction.type == 'deposit' ? transaction.amount : -transaction.amount
  end

end
