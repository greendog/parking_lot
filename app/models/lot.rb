class Lot
  attr_reader :slots
  attr_reader :number_slots

  def initialize(number_slots)
    @number_slots = number_slots
    @slots = []
  end

  def create!
    1.upto(number_slots) { |t| slots << Slot.new(t) }
    slots
  end

  def free_slots
    slots.select(&:free?)
  end

  def slot_by_position(position)
    slots.select { |slot| slot.position.equal?(position) }.first
  end
end
