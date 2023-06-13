# frozen_string_literal: true

require 'rails_helper'
require 'support/factory_bot'

RSpec.describe '/events', type: :request do
  let(:user) { User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 123_456) }

  let(:valid_attributes) do
    { user_id: user.id, name: 'Event Title', description: 'test', start_date_time: Date.today,
      end_date_time: Date.today }
  end

  let(:invalid_attributes) do
    { user_id: 2, address: 785, first: 'first' }
  end

  describe '#call' do
    context 'when query is present' do
      it 'returns matching events' do
        sign_in user
        event1 = create(:event, name: 'Ruby Conference', user: user)
        event2 = create(:event, name: 'Rails Workshop', user: user)
        create(:event, description: 'Web Development Conference', user: user)

        service = EventSearch.new('Ruby')
        result = service.call

        result = result.where(id: [event1.id, event2.id])

        expect(result.first).to eq(event1)
      end
    end

    context 'when query is empty' do
      it 'returns an empty array' do
        sign_in user
        service = EventSearch.new('')
        result = service.call

        expect(result.to_a).to be_empty
      end
    end
  end
end
