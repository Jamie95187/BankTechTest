require_relative '../../lib/statement'
require_relative '../../lib/account'
require_relative '../../lib/transaction_history'

describe Statement do

  it('should be able to print an empty statement') do
    statement = Statement.new
    expect { statement.print() }.to output.to_stdout { "date || credit || debit || balance" }
  end

  it('should print the statement with one deposit') do
    statement = Statement.new
    account = Account.new
    account.deposit(1000, "01/01/2020")
    expect { statement.print() }.to output.to_stdout { "date || credit || debit || balacne\n01/01/2020 || 1000 || || 1000" }
  end

  it('should print the statement with one deposit and one withrdawal') do
    statement = Statement.new
    account = Account.new
    account.deposit(1000, "01/01/2020")
    account.withdraw(500, "02/01/2020")
    expect { statement.print() }.to output.to_stdout { "date || credit || debit || balacne\n01/01/2020 || 1000 || || 1000\n02/01/2020 || || 500 || 500" }
  end

end
