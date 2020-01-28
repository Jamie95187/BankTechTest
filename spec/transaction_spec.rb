# require 'transaction'
#
# describe Transaction do
#   describe 'create_transaction' do
#
#     it('should return a transaction') do
#       transaction = Transaction.new('Deposit', 1000, Time.new.strftime('%d-%m-%Y'))
#       expect(transaction.create_transaction).to eq ['Deposit', Time.now.strftime('%d-%m-%Y'), 1000]
#     end
#
#   end
# end
