require 'transaction'

describe Transaction do

  it('should have a deposit action of 1000 at 01/01/2020') do
    transaction = Transaction.new('deposit', 1000, '01/01/2020')
    expect(transaction).to have_attributes(:action => 'deposit', :amount => 1000, :time => '01/01/2020')
  end

  it('should have a withdraw action of 2000 at 02/01/2020') do
    transaction = Transaction.new('withdraw', 2000, '02/01/2020')
    expect(transaction).to have_attributes(:action => 'withdraw', :amount => 2000, :time => '02/01/2020')
  end

end
