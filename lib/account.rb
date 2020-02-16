class Account

  def initialize(transaction_history_class = TransactionHistory.new)
    @transaction_history_class = transaction_history_class
  end

  def deposit(amount, time = Time.new.strftime("%d/%m/%Y"))
    @transaction_history_class.add_transaction( { action: "deposit", amount: amount, date: time } )
  end

  def withdraw(amount, time = Time.new.strftime("%d/%m/%Y"))
    @transaction_history_class.add_transaction( { action: "withdraw", amount: amount, date: time } )
  end

  private

  def deposit?(transaction)
    transaction.action == 'deposit'
  end

  def valid_action?(transaction)
    deposit?(transaction) || transaction.action == 'withdraw'
  end

end
