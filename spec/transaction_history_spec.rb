require 'transaction_history'

describe TransactionHistory do

  let(:transaction_history) { TransactionHistory.new }

  describe '#transaction_to_statement' do

    it('should translate a transaction into a statement') do
      transaction_deposit = { :action => 'deposit', :amount => 1000, :date => "01/01/2020" }
      expect(transaction_history.transaction_to_statement(transaction_deposit)).to eq "01/01/2020 || 1000.00 || || 1000.00"
    end

  end

  describe '#add_transaction' do

    let(:transaction_deposit) { { :action => 'deposit', :amount => 1000, :date => "01/01/2020" } }

    it('should return the transaction history log') do
      expect(transaction_history.add_transaction(transaction_deposit)).to eq ["01/01/2020 || 1000.00 || || 1000.00"]
    end

    it('should return the transaction history log') do
      transaction_withdraw = { :action => 'withdraw', :amount => 500, :date => "02/01/2020" }
      transaction_history.add_transaction(transaction_deposit)
      expect(transaction_history.add_transaction(transaction_withdraw)).to eq ["01/01/2020 || 1000.00 || || 1000.00", "02/01/2020 || || 500.00 || 500.00"]
    end

  end
  
end
