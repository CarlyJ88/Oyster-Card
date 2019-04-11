class Oystercard
  attr_reader :balance
  attr_reader :in_journey
  attr_reader :balance
  attr_reader :entry_station

  MAXLIMIT = 90
  MINFARE = 1

  def initialize
    @balance = 0
  end

  def top_up(value)
    raise "Top up limit exceeded #{Oystercard::MAXLIMIT}" if @balance + value > MAXLIMIT

    @balance += value
  end

  def in_journey?
    if @entry_station == nil
      false
    else 
      true
    end
  end 

  def initialize
    @in_journey = false
    @balance = 0
  end

  def touch_in(station_name)
    fail 'Insufficient funds' if @balance < MINFARE

    @in_journey = true
    @entry_station = station_name
  end

  def touch_out
    deduct(MINFARE)
    @in_journey = false
    @entry_station = nil
  end

  private
# when a method is made private you remove the test for it as long as another test covers the logic
  def deduct(value)
    @balance -= value
  end
end
