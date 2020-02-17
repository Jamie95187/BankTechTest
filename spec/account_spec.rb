require 'account'

describe Account do

  describe '#deposit' do

    let(:account) { Account.new(transaction_history_class) }
    let(:transaction_history_class) { double :transaction_history_class, add_transaction: [transaction] }
    let(:transaction) { double :transaction, action: 'deposit', amount: 1000, time: '01/01/2020' }

    it('should return 1000 when a deposit of 1000 is made') do
      expect(account.deposit(transaction, "01/01/2020")).to eq([transaction])
    end

  end

end
