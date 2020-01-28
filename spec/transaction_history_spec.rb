require 'transaction_history'

describe TransactionHistory do

  let(:account) { instance_double("Account") }

  it('should return a deposit statement of the last transaction that has been made') do
    transaction_history = TransactionHistory.new(account)
    allow(account).to receive(:display_balance) { 1000 }
    transaction = instance_double("Transaction", :type => 'deposit', :time => Time.new.strftime('%d/%m/%Y'), :amount => 1000)
    expect(transaction_history.transaction_to_statement(transaction)).to eq(Time.new.strftime('%d/%m/%Y') + ' || 1000.00 || || 1000.00')
  end

  it('should return a withdraw statement of the last transaction that has been made') do
    transaction_history = TransactionHistory.new(account)
    allow(account).to receive(:display_balance) { -2000 }
    transaction = instance_double("Transaction", :type => 'withdraw', :time => Time.new.strftime('%d/%m/%Y'), :amount => 2000)
    expect(transaction_history.transaction_to_statement(transaction)).to eq(Time.new.strftime('%d/%m/%Y') + ' || || 2000.00 || -2000.00')
  end

  it('should return a statement of the statement added to the log') do
    transaction_history = TransactionHistory.new(account)
    allow(account).to receive(:display_balance) { -2000 }
    transaction = instance_double("Transaction", :type => 'withdraw', :time => Time.new.strftime('%d/%m/%Y'), :amount => 2000)
    expect(transaction_history.add_statement(transaction)).to eq(Time.new.strftime('%d/%m/%Y') + ' || || 2000.00 || -2000.00')
  end

end
