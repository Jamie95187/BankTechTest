class Account

  def initialize
    @balance = 0
  end

  def update_balance(transaction)
    return @balance += transaction.amount if deposit?(transaction)

    raise 'Not enough balance to withdraw that amount!' unless transaction.amount <= @balance

    @balance -= transaction.amount
  end

  def display_balance
    @balance
  end

  private

  def deposit?(transaction)
    transaction.type == 'deposit'
  end

end
