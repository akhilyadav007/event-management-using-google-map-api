# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventCreator, type: :model do
  let(:user) { User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 123_456) }

  describe '#call' do
    let(:event_attributes) { { name: 'Test Event', description: 'Test Location', start_date_time: Date.today,
    end_date_time: Date.today, user: user } }

    it 'creates an event' do
      existing_count = Event.count

      EventCreator.new(event_attributes).call

      expect(Event.count).to eq(existing_count + 1)
    end
  end
end
