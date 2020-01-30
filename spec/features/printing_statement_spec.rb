require_relative '../../lib/bank_system'
require_relative '../../lib/transaction'
require_relative '../../lib/account'
require_relative '../../lib/transaction_history'

describe BankSystem do

  describe '#print_statement' do

    let(:system) { BankSystem.new }
    let(:time) { "01/01/2020" }
    let(:account) { Account.new }

    let(:transaction_history) { TransactionHistory.new(account) }

    it('should print an empty statement when no transactions have been made') do
      expect { system.print_statement(transaction_history) }.to output("date || credit || debit || balance\n").to_stdout
    end

    it('should print the statement of only one deposit made') do
      system.process('deposit', 1000, '01/01/2020', transaction_history)
      expect { system.print_statement(transaction_history) }.to output("date || credit || debit || balance\n01/01/2020 || 1000.00 || || 1000.00\n").to_stdout
    end

    it('should print the statement of the transactions made') do
      system.process('deposit', 1000, '01/01/2020', transaction_history)
      system.process('deposit', 2000, '02/01/2020', transaction_history)
      system.process('withdraw', 500, '03/01/2020', transaction_history)
      expect { system.print_statement(transaction_history) }.to output("date || credit || debit || balance\n03/01/2020 || || 500.00 || 2500.00\n02/01/2020 || 2000.00 || || 3000.00\n01/01/2020 || 1000.00 || || 1000.00\n").to_stdout
    end

    it('should raise an error when an invalid transaction is made') do
      system.process('BOOM', 1000, '01/01/2020', transaction_history)
      expect { system.print_statement(transaction_history) }.to output("date || credit || debit || balance\n").to_stdout
    end

  end

end
