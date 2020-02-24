class Statement

  def print_statement(transaction_history)
    print "date || credit || debit || balance\n" + transaction_history.log.reverse.join("\n")
  end

end
