class Statement

  def initialize(transaction_history_class = TransactionHistory)
    @transaction_history_class = transaction_history_class
  end

  def print
    puts "date || credit || debit || balance\n" + @transaction_history_class.log.reverse.join("\n")
  end

end
