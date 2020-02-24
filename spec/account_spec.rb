require 'account'

describe Account do

  let(:account) { Account.new(transaction_history_class) }
  let(:transaction_history_class) { double :transaction_history_class }
  let(:transaction_withdraw) { double :transaction_withdraw, :[] => {:action => "deposit", :amount => 1000, :date => "01/01/2020"} }

  describe '#deposit' do

    it('should return a transaction hash when a deposit of 1000 is made') do
      # allow(transaction_withdraw).to receive(:[]).with(:action).and_return("deposit")
      # allow(transaction_withdraw).to receive(:[]).with(:amount).and_return("1000")
      # allow(transaction_withdraw).to receive(:[]).with(:date).and_return("01/01/2020")
      allow(transaction_history_class).to receive(:add_transaction).with( transaction_withdraw )
      expect(account.deposit(1000, "01/01/2020")).to eq(["01/01/2020 || || 1000.00 || 1000.00"])
    end

  end

  describe '#withdraw' do

    it('should return a transaction hash when a withdrawal of 500 is made') do
      allow(transaction_history_class).to receive(:add_transaction).with({:action => "deposit", :amount => 1000, :date => "01/01/2020"}) { ["01/01/2020 || || 1000.00 || 1000.00"] }
      allow(transaction_history_class).to receive(:add_transaction).with({:action => "withdraw", :amount => 1000, :date => "01/01/2020"}) { ["01/01/2020 || || 500.00 || 500.00"] }
      expect(account.deposit(1000, "01/01/2020")).to eq(["01/01/2020 || || 1000.00 || 1000.00"])
    end

  end

end
