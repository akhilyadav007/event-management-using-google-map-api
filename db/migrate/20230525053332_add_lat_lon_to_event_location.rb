# frozen_string_literal: true

class AddLatLonToEventLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :event_locations, :lat, :decimal, precision: 10, scale: 6
    add_column :event_locations, :lng, :decimal, precision: 10, scale: 6
    add_reference :event_locations, :event, foreign_key: true
  end
end
