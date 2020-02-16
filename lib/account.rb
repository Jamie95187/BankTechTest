class Account

  def initialize(statement = Statement.new, transaction_class = Transaction)
    @statement = statement
    @transaction_class = transaction_class
  end

  # def update_balance(transaction)
  #   raise ArgumentError.new 'Invalid action!' unless valid_action?(transaction)
  #   return @balance += transaction.amount if deposit?(transaction)
  #
  #   raise ArgumentError.new 'Not enough balance!' unless transaction.amount <= @balance
  #
  #   @balance -= transaction.amount
  # end

  def deposit(amount)
    transaction = @transaction_class.new('deposit', amount)
    @transaction_history.add_transaction(transaction)
    @transaction_history.balance
  end

  private

  def deposit?(transaction)
    transaction.action == 'deposit'
  end

  def valid_action?(transaction)
    deposit?(transaction) || transaction.action == 'withdraw'
  end

end
