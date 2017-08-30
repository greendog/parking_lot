class CommandDispatcher
  class << self
    def parse(str)
      return if str.nil? || str.empty?
      arr = str.split(/\s+/)
      method = arr.shift.to_sym
      send(method, arr) unless arr.empty?
      send(method) if arr.empty?
    rescue NoMethodError => err
      puts("Method with name <#{method}> not found")
    end

    private

    def create_parking_lot(args)
      puts ParkingController.create_slots(size: args.first.to_i)
    end

    def park(args)
      puts ParkingController.park_car(number: args[0], colour: args[1])
    end

    def leave(args)
      puts ParkingController.leave_slot(position: args.first.to_i)
    end

    def status
      puts ParkingController.status
    end

    def registration_numbers_for_cars_with_colour(args)
      puts ParkingController.numbers_by_colour(colour: args.first)
    end

    def slot_numbers_for_cars_with_colour(args)
      puts ParkingController.slots_by_colour(colour: args.first)
    end

    def slot_number_for_registration_number(args)
      puts ParkingController.slot_by_number(number: args.first)
    end
  end
end
