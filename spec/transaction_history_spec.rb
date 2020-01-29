require 'transaction_history'

describe TransactionHistory do

  let(:account) { instance_double("Account") }
  let(:transaction_history) { TransactionHistory.new(account) }

  it('should return a deposit statement of the last transaction that has been made') do
    allow(account).to receive(:balance) { 1000 }
    transaction = instance_double("Transaction", :action => 'deposit', :time => '01/01/2020', :amount => 1000)
    expect(transaction_history.transaction_to_statement(transaction)).to eq('01/01/2020 || 1000.00 || || 1000.00')
  end

  it('should return a withdraw statement of the last transaction that has been made') do
    allow(account).to receive(:balance) { 1000 }
    transaction = instance_double("Transaction", :action => 'withdraw', :time => '01/01/2020', :amount => 2000)
    expect(transaction_history.transaction_to_statement(transaction)).to eq('01/01/2020 || || 2000.00 || 1000.00')
  end

  it('should return a credit statement added to the log') do
    allow(account).to receive(:balance) { 1000 }
    transaction = instance_double("Transaction", :action => 'deposit', :time => '01/01/2020', :amount => 1000)
    expect(transaction_history.add_statement(transaction)).to eq('01/01/2020 || 1000.00 || || 1000.00')
  end

  it('should return a debit statement added to the log') do
    allow(account).to receive(:balance) { 1000 }
    transaction = instance_double("Transaction", :action => 'withdraw', :time => '01/01/2020', :amount => 2000)
    expect(transaction_history.add_statement(transaction)).to eq('01/01/2020 || || 2000.00 || 1000.00')
  end

end
