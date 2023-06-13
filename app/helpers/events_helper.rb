# frozen_string_literal: true

module EventsHelper
  # validate :end_date_greater_than_start_date
  def schedule(start_date_time, end_date_time)
    start_date_time = start_date_time.in_time_zone(Time.zone)
    end_date_time = end_date_time.in_time_zone(Time.zone)
    "#{start_date_time.strftime('%d/%m/%Y %H:%M')} - #{end_date_time.strftime('%d/%m/%Y %H:%M')}"
  end
end
