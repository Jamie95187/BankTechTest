class Account

  def initialize(transaction_history_class = TransactionHistory.new)
    @transaction_history_class = transaction_history_class
  end

  def deposit(amount)
    transaction = @transaction_history_class.new('deposit', amount)
    @transaction_history_class.add_transaction(transaction)
    @transaction_history_class.balance
  end

  private

  def deposit?(transaction)
    transaction.action == 'deposit'
  end

  def valid_action?(transaction)
    deposit?(transaction) || transaction.action == 'withdraw'
  end

end
