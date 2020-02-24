require 'account'

describe Account do

  let(:account) { Account.new(transaction_history) }
  let(:transaction_history) { double :transaction_history }
  let(:transaction_deposit) { double :transaction_deposit }
  let(:transaction_withdraw) { double :transaction_withdraw }
  let(:log) { double :log }

  describe '#deposit' do

    it('should return a transaction hash when a deposit of 1000 is made') do
      allow(transaction_history).to receive(:add_transaction).with({ :action => "deposit", :amount => 1000, :date => "01/01/2020" }).and_return log
      allow(transaction_history).to receive(:transaction_to_statement).with(transaction_deposit)
      expect(account.deposit(1000, "01/01/2020")).to eq(log)
    end

  end

  describe '#withdraw' do

    it('should return a transaction hash when a withdrawal of 500 is made') do
      allow(transaction_history).to receive(:add_transaction).with({ :action => "deposit", :amount => 1000, :date => "01/01/2020" }).and_return log
      allow(transaction_history).to receive(:transaction_to_statement).with(transaction_deposit)
      account.deposit(1000, "01/01/2020")
      allow(transaction_history).to receive(:add_transaction).with({ :action => "withdraw", :amount => 500, :date => "02/01/2020" }).and_return log
      allow(transaction_history).to receive(:transaction_to_statement).with(transaction_withdraw)
      expect(account.withdraw(500, "02/01/2020")).to eq(log)
    end

  end

end
