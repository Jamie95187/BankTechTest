class TransactionHistory

  attr_accessor :balance
  attr_reader :log

  def initialize
    @log = []
    @balance = 0
  end

  def add_transaction(transaction)
    @balance += transaction.amount
    @log << transaction
  end

  def add_statement(transaction)
    @log << transaction_to_statement(transaction)
    transaction_to_statement(transaction)
  end

  def transaction_to_statement(transaction)
    if transaction.action == 'deposit'
      return transaction.time + " || #{transaction.amount}.00 || " +
      "|| #{@account.balance}.00"
    end
    transaction.time + " || || #{transaction.amount}.00 || " +
    "#{@account.balance}.00"
  end
end
