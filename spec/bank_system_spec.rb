require 'bank_system'

describe BankSystem do

  subject(:bank_system) { BankSystem.new(transaction_class) }
  let(:transaction_class) { double :transaction_class, new: transaction_deposit }
  let(:account) { double :account, update_balance: nil }
  let(:transaction_history) { double :transaction_history, add_statement: nil, log: nil, account: account }
  let(:transaction_deposit) { double :transaction, :action => 'desposit', :amount => 1000, :time => '01/01/2020' }

  it('should return a transaction that is a deposit of 1000 on 01/01/2020') do
    expect(bank_system.process('deposit', 1000, transaction_history)).to eq transaction_deposit
  end

  it('should return a transaction that is a withdrawal of 2000 on 02/02/2020') do
    transaction_withdraw = instance_double("Transaction", :action => 'withdraw', :amount => 2000, :time => '02/01/2020')
    transaction_class = instance_double("Transaction_class", new: transaction_withdraw)
    bank_system = BankSystem.new(transaction_class)
    expect(bank_system.process('deposit', 1000, transaction_history)).to eq transaction_withdraw
  end

end
