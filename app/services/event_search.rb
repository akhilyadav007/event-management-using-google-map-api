# frozen_string_literal: true

class EventSearch < ApplicationService
  def initialize(query)
    @query = query
  end

  attr_reader :query

  def call
    if query.present?
      Event.where('name LIKE ?', "%#{query}%")
           .or(Event.where('description LIKE ?', "%#{query}%"))
    else
      []
    end
  end
end
