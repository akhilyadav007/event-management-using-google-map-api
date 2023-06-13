# frozen_string_literal: true

class CreateEventLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :event_locations do |t|
      t.text :address

      t.timestamps
    end
  end
end
