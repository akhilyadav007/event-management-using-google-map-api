# frozen_string_literal: true

class EventCreator < ApplicationService
  def initialize(param)
    @event_attributes = param
  end

  attr_reader :event_attributes

  def call
      Event.create!(event_attributes)
    rescue StandardError => e
      puts "An error occurred while creating the event: #{e.message}"
      raise "#{e.message}".inspect
  end
end



