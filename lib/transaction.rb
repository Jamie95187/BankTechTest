class Transaction

  attr_reader :action, :time, :amount

  def initialize(action, amount, time = Time.new.strftime('%d/%m/%Y'))
    @action = action
    @time = time
    @amount = amount
  end

end
