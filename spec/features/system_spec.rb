require 'system'
require 'transaction'
require 'account'
require 'transaction_history'

describe System do

  describe '#print_statement' do

    let(:system) { System.new }
    let(:time) { "01/01/2020" }
    let(:account) { Account.new }

    let (:transaction_history) { TransactionHistory.new(account) }
    let (:transaction_deposit_1000) { Transaction.new('deposit', 1000, time) }
    let (:transaction_withdraw_500) { Transaction.new('withdraw', 500, time) }
    let (:transaction_deposit_2000) { Transaction.new('deposit', 2000, time) }

    it('should print an empty statement when no transactions have been made') do
      expect { system.print_statement(transaction_history) }.to output("date || credit || debit || balance\n").to_stdout
    end

    it('should print the statement of only one deposit made') do
      account.update_balance(transaction_deposit_1000)
      transaction_history.add_statement(transaction_deposit_1000)
      expect { system.print_statement(transaction_history) }.to output("date || credit || debit || balance\n01/01/2020 || 1000.00 || || 1000.00\n").to_stdout
    end

    it('should print the statement of the transactions made') do
      account.update_balance(transaction_deposit_1000)
      transaction_history.add_statement(transaction_deposit_1000)
      account.update_balance(transaction_deposit_2000)
      transaction_history.add_statement(transaction_deposit_2000)
      account.update_balance(transaction_withdraw_500)
      transaction_history.add_statement(transaction_withdraw_500)
      expect { system.print_statement(transaction_history) }.to output("date || credit || debit || balance\n01/01/2020 || || 500.00 || 2500.00\n01/01/2020 || 2000.00 || || 3000.00\n01/01/2020 || 1000.00 || || 1000.00\n").to_stdout
    end

  end

end
