# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create(email: 'user@example.com', password: 'password') }

  describe '#email' do
    it 'returns the user email' do
      user = create(:user, email: 'john@example.com')

      expect(user.email).to eq('john@example.com')
    end
  end

  describe '#address' do
    it 'returns the address of the event location' do
      event_location = EventLocation.new(address: '123 Main St')
      event = Event.new(event_location: event_location)

      address = event.address

      expect(address).to eq('123 Main St')
    end

    it 'returns nil if event location is not present' do
      event = Event.new

      address = event.address

      expect(address).to be_nil
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)

      expect(association.macro).to eq(:belongs_to)
    end

    it 'has one event location' do
      association = described_class.reflect_on_association(:event_location)

      expect(association.macro).to eq(:has_one)
      expect(association.options[:dependent]).to eq(:destroy)
    end
  end

  describe 'nested attributes' do
    it 'accepts nested attributes for event location' do
      expect(described_class.nested_attributes_options).to have_key(:event_location)
    end
  end

  describe 'validations' do
    it 'should validate the presence of name' do
      event = Event.new(name: nil)
      expect(event).to_not be_valid
      expect(event.errors.messages[:name]).to include('can\'t be blank')
    end

    it 'should validate the presence of start_date_time' do
      event = Event.new(start_date_time: nil)
      expect(event).to_not be_valid
      expect(event.errors.messages[:start_date_time]).to include('can\'t be blank')
    end

    it 'should validate the presence of end_date_time' do
      event = Event.new(end_date_time: nil)
      expect(event).to_not be_valid
      expect(event.errors.messages[:end_date_time]).to include('can\'t be blank')
    end
  end
end
