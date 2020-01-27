require 'account'

describe Account do

  describe '#update_balance' do

    account = Account.new('TestOne')

    context 'valid transactions' do

      it('should return 1000 when a transaction of deposit 1000 is made') do
        transaction = instance_double("Transaction", :type => 'deposit', :time => Time.new.strftime('%d-%m-%Y'), :amount => 1000)
        expect(account.update_balance(transaction)).to eq 1000
      end

      it('should return -1000 when a transaction of withdrawing 1000 is made') do
        transaction = instance_double("Transaction", :type => 'withdraw', :time => Time.new.strftime('%d-%m-%Y'), :amount => 1000)
        expect(account.update_balance(transaction)).to eq(-1000)
      end

    end

  end

end
