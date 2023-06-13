# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'John' }
    description { 'india' }
    start_date_time { DateTime.current }
    end_date_time { DateTime.current + 1.hour }
  end
end
