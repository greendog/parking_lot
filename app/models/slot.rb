class Slot < Struct.new(:position)
  attr_reader :car

  def park(number, color)
    @car = Car.new(number, color)
  end

  def leave
    @car = nil
  end

  def free?
    car.nil?
  end
end
