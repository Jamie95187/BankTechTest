require 'account'

describe Account do

  describe '#update_balance' do

    before(:each) do
      @account = Account.new
    end

    it('should return 1000 when a transaction of deposit 1000 is made') do
      transaction = instance_double("Transaction", :type => 'deposit', :time => Time.new.strftime('%d-%m-%Y'), :amount => 1000)
      expect(@account.update_balance(transaction)).to eq 1000
    end

    it('should return -1000 when a transaction of withdrawing 1000 is made') do
      transaction = instance_double("Transaction", :type => 'withdraw', :time => Time.new.strftime('%d-%m-%Y'), :amount => 1000)
      expect(@account.update_balance(transaction)).to eq(-1000)
    end

  end

  describe '#display_balance' do

    it('should return 2000 when a deposit of 2000 is made') do
      account = Account.new
      transaction = instance_double("Transaction", :type => 'deposit', :time => Time.new.strftime('%d-%m-%Y'), :amount => 2000)
      account.update_balance(transaction)
      expect(account.display_balance).to eq 2000
    end

  end

end
