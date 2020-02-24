require_relative '../../lib/statement'
require_relative '../../lib/account'
require_relative '../../lib/transaction_history'

describe Statement do

  let(:statement) { Statement.new }
  let(:account) { Account.new }

  it('should be able to print an empty statement') do
    expect { statement.print_statement(account.transaction_history) }.to(output.to_stdout { "date || credit || debit || balance" })
  end

  it('should print the statement with one deposit') do
    account.deposit(1000, "01/01/2020")
    expect { statement.print_statement(account.transaction_history) }.to(output.to_stdout { "date || credit || debit || balance\n01/01/2020 || 1000.00 || || 1000.00\n" })
  end

  it('should print the statement with one deposit and one withrdawal') do
    account.deposit(1000, "01/01/2020")
    account.withdraw(500, "02/01/2020")
    expect { statement.print_statement(account.transaction_history) }.to output("date || credit || debit || balance\n02/01/2020 || || 500.00 || 500.00\n01/01/2020 || 1000.00 || || 1000.00\n").to_stdout
  end

end
