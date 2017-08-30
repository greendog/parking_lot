class ParkingController
  class << self
    def create_slots(size:)
      @lot = Lot.new
      @lot.create(size)
      "Created a parking lot with #{size} slots"
    end

    def park_car(number:, colour:)
      slot = @lot.free_slots.first
      return 'Sorry, parking lot is full' if slot.nil?
      slot&.park(number, colour)
      "Allocated slot number: #{slot.position}"
    end

    def leave_slot(position:)
      slot = @lot.slot_by_position(position)
      slot&.leave
      "Slot number #{slot.position} is free"
    end

    def status
      @lot.status
    end

    def numbers_by_colour(colour:)
     @lot.slots_by_colour(colour).map { |slot| slot.car.number }.join(', ')
    end

    def slots_by_colour(colour:)
      @lot.slots_by_colour(colour).map(&:position).join(', ')
    end

    def slot_by_number(number:)
      result = @lot.slots_by_number(number).map(&:position)
      return 'No found' if result.empty?
      result.join(', ')
    end
  end
end
