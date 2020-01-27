require 'account'

describe Account do

  describe '#update_balance' do

    it('should return 1000 when a transaction of deposit 1000 is made') do
      transaction = instance_double("Transaction", :type => 'deposit', :time => Time.new.strftime('%d-%m-%Y'))
      allow(transaction).to receive(:amount) { 1000 }
      account = Account.new('TestOne')
      expect(account.update_balance(transaction)).to eq -1000
    end

  end
end
