class Statement

  def print_statement(transaction_history)
    puts "date || credit || debit || balance\n" + transaction_history.log.reverse.join("\n")
  end

end
