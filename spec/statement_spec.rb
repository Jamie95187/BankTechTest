describe Statement do

  describe '#print' do

    let(:account) { double :account }
    let(:transaction_history) { double :transaction_history, log: [], add_statement: nil }
    let(:statement) { Statement.new }

    it('should print a blank statement') do
      expect { statement.print_statement(transaction_history) }.to output("date || credit || debit || balance\n").to_stdout
    end

    it('should print a statement with one deposit of 1000') do
      allow(transaction_history).to receive(:log) { ["01/01/2020 || 1000.00 || || 1000.00\n"] }
      expect { statement.print_statement(transaction_history) }.to output("date || credit || debit || balance\n01/01/2020 || 1000.00 || || 1000.00\n").to_stdout
    end

    it('should print a statement with one deposit of 1000 and one withdraw of 500') do
      allow(transaction_history).to receive(:log) { ["01/01/2020 || 1000.00 || || 1000.00", "02/01/2020 || || 500.00 || 500.00"] }
      expect { statement.print_statement(transaction_history) }.to output("date || credit || debit || balance\n01/01/2020 || 1000.00 || || 1000.00\n02/01/2020 || || 500.00 || 500.00").to_stdout
    end
  end

end
