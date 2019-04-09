class Journey

  attr_reader :in_journey
  
  def initialize
    @in_journey = false
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end