# frozen_string_literal: true

require 'spec_helper'

describe Lot do
  let(:number_slots) { 6 }
  let(:lot) { Lot.new }

  before :each do
    lot.create number_slots
  end

  describe '#create' do
    it 'returns an array of the slots' do
      expect(lot.slots).to have(number_slots).items
      expect(lot.slots.first).to be_an_instance_of Slot
    end
  end

  describe '#slot_by_position' do
    it 'find slots by position' do
      expect(lot.slot_by_position(4)).to be_an_instance_of Slot
      expect(lot.slot_by_position(number_slots + 1)).to be_nil
    end
  end

  describe '#slots_by_colour' do
    it 'find slots by colour' do
      slot = lot.free_slots.first
      slot.park('KA-01-HH-3141', 'Black')
      expect(lot.slots_by_colour('Black')).to have(1).items
      expect(lot.slots_by_colour('Blue')).to have(0).items
    end
  end

  describe '#slots_by_number' do
    it 'find slots by number' do
      slot = lot.free_slots.first
      slot.park('KA-01-HH-3141', 'Black')
      expect(lot.slots_by_number('KA-01-HH-3141')).to have(1).items
      expect(lot.slots_by_number('KA-01-HH-3142')).to have(0).items
    end
  end
end
