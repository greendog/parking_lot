class Lot
  attr_reader :slots

  def initialize
    @slots = []
  end

  def create(number_slots)
    1.upto(number_slots) { |t| slots << Slot.new(t) }
    slots
  end

  def free_slots
    slots.select(&:free?)
  end

  def slot_by_position(position)
    slots.select { |slot| slot.position.eql?(position) }.first
  end

  def slots_by_colour(colour)
    slots.select { |slot| slot.car.colour.eql?(colour) if slot.car }
  end

  def slots_by_number(number)
    slots.select { |slot| slot.car.number.eql?(number) if slot.car }
  end

  def status
    TableFormater.format slots
  end
end
