class TransactionHistory

  attr_reader :log

  def initialize(account = Account.new)
    @account = account
    @log = []
  end

  def add_statement(transaction)
    @log << transaction_to_statement(transaction)
    transaction_to_statement(transaction)
  end

  def transaction_to_statement(transaction)
    if transaction.type == 'deposit'
      return transaction.time + " || #{transaction.amount}.00 || " +
      "|| #{@account.display_balance}.00"
    end
    transaction.time + " || || #{transaction.amount}.00 || " +
    "#{@account.display_balance}.00"
  end
end
