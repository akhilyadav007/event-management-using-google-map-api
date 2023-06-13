# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventLocation, type: :model do
  describe 'associations' do
    it 'belongs to an event' do
      association = described_class.reflect_on_association(:event)

      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe "validations" do
    it "should require an address" do
      event_location = EventLocation.new(address: nil)
      expect(event_location).to_not be_valid
      expect(event_location.errors[:address]).to include("can't be blank")
    end
  end
end
