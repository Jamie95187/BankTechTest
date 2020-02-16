require_relative '../../lib/statement'
require_relative '../../lib/account'
require_relative '../../lib/transaction_history'

describe BankSystem do

  it('should be able to print an empty statement') do
    statement = Statement.new
    expect { statement.print() }.to output.to_stdout { "date || credit || debit || balance" }
  end

  # it('should print the statement with one deposit') do
  #   statement = Statement.new
  #   account = Account.new
  #   account.deposit
  #   expect { statement.print() }.to output,to_
  # end
end
