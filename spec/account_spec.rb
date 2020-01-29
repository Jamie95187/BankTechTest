require 'account'

describe Account do

  describe '#update_balance' do

    context 'A valid transaction' do

      before(:each) do
        @account = Account.new
      end

      it('should return 1000 when a transaction of deposit 1000 is made') do
        transaction_deposit = instance_double("Transaction", :type => 'deposit', :time => '01/01/2020', :amount => 1000)
        expect(@account.update_balance(transaction_deposit)).to eq 1000
      end

      it('should return 2000 when two deposits of 1000 are made') do
        transaction_deposit = instance_double("Transaction", :type => 'deposit', :time => '01/01/2020', :amount => 1000)
        @account.update_balance(transaction_deposit)
        expect(@account.update_balance(transaction_deposit)).to eq 2000
      end

      it('should return 0 when a deposit of 1000 is made followed by a withdrawal of 1000') do
        transaction_deposit = instance_double("Transaction", :type => 'deposit', :time => '01/01/2020', :amount => 1000)
        transaction_withdrawal = instance_double("Transaction", :type => 'withdraw', :time => '01/01/2020', :amount => 1000)
        @account.update_balance(transaction_deposit)
        expect(@account.update_balance(transaction_withdrawal)).to eq(0)
      end

      it('should return 1000 when a deposit of 3000 is made followed by two withdrawals of 1000') do
        transaction_deposit = instance_double("Transaction", :type => 'deposit', :time => '01/01/2020', :amount => 3000)
        transaction_withdrawal = instance_double("Transaction", :type => 'withdraw', :time => '01/01/2020', :amount => 1000)
        @account.update_balance(transaction_deposit)
        @account.update_balance(transaction_withdrawal)
        expect(@account.update_balance(transaction_withdrawal)).to eq(1000)
      end

    end

    context 'An invalid transaction' do

      it('should raise an error when a withdrawal is made when there is not enough balance') do
        account = Account.new
        transaction_withdrawal = instance_double("Transaction", :type => 'withdraw', :time => '01/01/2020', :amount => 1000)
        expect { account.update_balance(transaction_withdrawal) }.to raise_error("Not enough balance to withdraw that amount!")
      end

    end

  end

  describe '#display_balance' do

    it('should return 2000 when a deposit of 2000 is made') do
      account = Account.new
      transaction = instance_double("Transaction", :type => 'deposit', :time => '01/01/2020', :amount => 2000)
      account.update_balance(transaction)
      expect(account.display_balance).to eq 2000
    end

  end

end
