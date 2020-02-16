require 'account'

describe Account do

  describe '#deposit' do

    let(:account) { Account.new }
    let(:transaction) { double :transaction, action: 'deposit', amount: 1000, time: '01/01/2020'}

    # it('should return 1000 when a deposit of 1000 is made') do
    #   expect(account.deposit(1000)).to eq 1000
    # end

  end

end
