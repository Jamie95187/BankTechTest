class Account

  attr_reader :transaction_history

  def initialize(transaction_history = TransactionHistory.new)
    @transaction_history = transaction_history
  end

  def deposit(amount, time = Time.new.strftime("%d/%m/%Y"))
    @transaction_history.add_transaction({
      :action => "deposit",
      :amount => amount,
      :date => time
    })
  end

  def withdraw(amount, time = Time.new.strftime("%d/%m/%Y"))
    @transaction_history.add_transaction({
      :action => "withdraw",
      :amount => amount,
      :date => time
    })
  end

end
