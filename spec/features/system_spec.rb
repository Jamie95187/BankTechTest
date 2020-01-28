require 'system'
require 'transaction'
require 'account'
require 'transaction_history'

describe System do

  describe '#print_statement' do

    system = System.new

    it('should print the statement of the transactions made') do
      account = Account.new
      transaction = Transaction.new('deposit', 1000)
      transaction_history = TransactionHistory.new(account)
      account.update_balance(transaction)
      transaction_history.add_statement(transaction)
      transaction = Transaction.new('deposit', 2000)
      account.update_balance(transaction)
      transaction_history.add_statement(transaction)
      transaction = Transaction.new('withdraw', 500)
      account.update_balance(transaction)
      transaction_history.add_statement(transaction)
      expect { system.print_recent_history(transaction_history) }.to output("date || credit || debit || balance\n28/01/2020 || || 500.00 || 2500.00\n28/01/2020 || 2000.00 || || 3000.00\n28/01/2020 || 1000.00 || || 1000.00\n").to_stdout
    end

  end

end
