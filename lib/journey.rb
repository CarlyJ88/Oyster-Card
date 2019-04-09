class Journey

  attr_reader :in_journey
  attr_reader :balance
  MINFARE = 1

  def initialize
    @in_journey = false
    @balance = 0
  end

  def touch_in
    fail 'Insufficient funds' if @balance < MINFARE

    @in_journey = true
  end

  def touch_out
    deduct(MINFARE)
    @in_journey = false
  end

  private
# when a method is made private you remove the test for it as long as another test covers the logic
  def deduct(value)
    @balance -= value
  end
end