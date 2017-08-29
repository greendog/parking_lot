# frozen_string_literal: true

require 'spec_helper'

describe Lot do
  let(:number_slots) { 6 }
  let(:lot) { Lot.new number_slots }

  describe '#create' do
    it 'returns an array of the slots' do
      slots = lot.create!
      expect(slots).to have(number_slots).items
      expect(slots.first).to be_an_instance_of Slot
    end
  end
end
