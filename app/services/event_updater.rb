# frozen_string_literal: true

class EventUpdater < ApplicationService
  def initialize(param, event)
    @event_attributes = param
    @event = event
  end

  attr_reader :event_attributes, :event
  def call
      event.update(event_attributes)
    rescue StandardError => e
      puts "An error occurred while updating the event: #{e.message}"
      raise "#{e.message}".inspect
  end
end
