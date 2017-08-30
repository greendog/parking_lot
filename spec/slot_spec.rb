# frozen_string_literal: true

require 'spec_helper'

describe Slot do
  let(:position) { 3 }
  let(:slot) { Slot.new position }

  describe '#park' do
    it 'add a car to slot' do
      slot.park('KA-01-HH-1234', 'White')
      expect(slot.car).to be_an_instance_of Car
    end
  end

  describe '#leave' do
    it 'remove a car from the slot' do
      slot.park('KA-01-HH-1234', 'White')
      expect(slot.car).to be_an_instance_of Car
      slot.leave
      expect(slot.free?).to be_truthy
    end
  end
end
