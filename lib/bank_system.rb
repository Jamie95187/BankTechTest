class BankSystem

  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
  end

  def print_statement(transaction_history)
    puts "date || credit || debit || balance\n" + transaction_history.log.reverse.join("\n")
  end

  def process(action, amount, transaction_history)
    transaction = @transaction_class.new(action, amount)
    transaction_history.account.update_balance(transaction)
    transaction_history.add_statement(transaction)
    transaction
  end

end
