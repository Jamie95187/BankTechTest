class TransactionHistory

  def initialize(account = Account.new)
    @account = account
    @log = [['date || credit || debit || balance']]
  end

  def add_statement(transaction)
    @log << transaction_to_statement(transaction)
    transaction_to_statement(transaction)
  end

  def transaction_to_statement(transaction)
    if transaction.type == 'deposit'
      return transaction.time + " || #{transaction.amount}.00 || " +
      "|| #{@account.display_balance + transaction.amount}.00"
    end
    transaction.time + " || || #{transaction.amount}.00 || " +
    "#{@account.display_balance - transaction.amount}.00"
  end
end
