class System

  def print_recent_history(transaction_history)
    puts "date || credit || debit || balance\n" + transaction_history.log.reverse.join("\n")
  end

end
