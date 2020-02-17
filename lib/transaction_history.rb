class TransactionHistory

  attr_accessor :balance
  attr_reader :log

  def initialize
    @log = []
    @balance = 0
  end

  def add_transaction(transaction)
    @log << transaction_to_statement(transaction)
  end

  def transaction_to_statement(transaction)
    if transaction[:action] == 'deposit'
      @balance += transaction[:amount]
      return "#{transaction[:date]}" + " || #{transaction[:amount]}.00 || " +
      "|| #{@balance}.00"
    end
    @balance -= transaction[:amount]
    "#{transaction[:date]}" + " || || #{transaction[:amount]}.00 || " +
    "#{@balance}.00"
  end

end
