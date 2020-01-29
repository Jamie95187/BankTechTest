class Account

  def initialize
    @balance = 0
  end

  def update_balance(transaction)
    raise 'Invalid transaction action!' unless valid_action?(transaction)
    return @balance += transaction.amount if deposit?(transaction)

    raise 'Not enough balance to withdraw that amount!' unless transaction.amount <= @balance

    @balance -= transaction.amount
  end

  def display_balance
    @balance
  end

  private

  def deposit?(transaction)
    transaction.action == 'deposit'
  end

  def valid_action?(transaction)
    deposit?(transaction) || transaction.action == 'withdraw'
  end

end
