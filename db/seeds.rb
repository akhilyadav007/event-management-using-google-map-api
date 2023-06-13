# frozen_string_literal: true

require 'faker'

# Generate fake data for User table
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

# Generate fake data for Event table
10.times do
  Event.create!(
    name: Faker::Lorem.word,
    start_date_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
    end_date_time: Faker::Time.between(from: DateTime.now + 30, to: DateTime.now + 60),
    user_id: User.pluck(:id).sample,
    description: Faker::Lorem.sentence(word_count: 50)
  )
end

# Generate fake data for EventLocation table
10.times do
  EventLocation.create!(
    address: Faker::Address.full_address,
    lat: Faker::Address.latitude,
    lng: Faker::Address.longitude,
    event_id: Event.pluck(:id).sample
  )
end
