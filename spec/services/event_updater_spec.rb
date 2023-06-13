# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventUpdater, type: :model do
  let(:user) { User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 123_456) }
  let(:event_id) { 1 }
  let(:event_attributes) { { name: 'Updated Event', description: 'Updated Location' } }

  describe '#call' do
    it 'updates an event' do
      event = Event.create!(name: 'Test Event', description: 'Test Location', start_date_time: Date.today,
      end_date_time: Date.today, user: user)

      EventUpdater.new(event_attributes, event).call

      event.reload

      expect(event.name).to eq('Updated Event')
      expect(event.description).to eq('Updated Location')
    end
  end
end
