class Transaction

  attr_reader :type, :time, :amount

  def initialize(type, amount, time = Time.new.strftime('%d/%m/%Y'))
    @type = type
    @time = time
    @amount = amount
  end

end
