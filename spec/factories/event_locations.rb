# frozen_string_literal: true

FactoryBot.define do
  factory :event_location do
    address { 'indore' }
    lat { 22.719568 }
    lng { 75.857727 }
  end
end
