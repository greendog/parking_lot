class Lot
  attr_accessor :slots
  attr_accessor :number_slots

  def initialize(number_slots)
    @number_slots = number_slots
    @slots = []
  end

  def create!
    1.upto(number_slots) { |t| slots << Slot.new(t) }
    slots
  end
end
