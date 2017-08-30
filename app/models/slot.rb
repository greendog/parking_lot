class Slot < Struct.new(:position)
  attr_reader :car

  def park(number, colour)
    @car = Car.new(number, colour)
  end

  def leave
    @car = nil
  end

  def free?
    car.nil?
  end
end
