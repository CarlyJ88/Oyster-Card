class Oystercard
  attr_reader :balance
  MAXLIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    raise "Top up limit exceeded #{Oystercard::MAXLIMIT}" if @balance + value > MAXLIMIT

    @balance += value
  end

  def deduct(value)
    @balance -= value
  end
end
