require_relative '../../lib/statement'
require_relative '../../lib/account'
require_relative '../../lib/transaction_history'

describe Statement do

  it('should be able to print an empty statement') do
    statement = Statement.new
    account = Account.new
    expect { statement.print_statement(account.transaction_history_class) }.to(output.to_stdout { "date || credit || debit || balance" })
  end

  it('should print the statement with one deposit') do
    statement = Statement.new
    account = Account.new
    account.deposit(1000, "01/01/2020")
    expect { statement.print_statement(account.transaction_history_class) }.to(output.to_stdout { "date || credit || debit || balance\n01/01/2020 || 1000.00 || || 1000.00" })
  end

  it('should print the statement with one deposit and one withrdawal') do
    statement = Statement.new
    account = Account.new
    account.deposit(1000, "01/01/2020")
    account.withdraw(500, "02/01/2020")
    expect { statement.print_statement(account.transaction_history_class) }.to output("date || credit || debit || balance\n01/01/2020 || 1000.00 || || 1000.00\n02/01/2020 || || 500.00 || 500.00").to_stdout
  end

end
