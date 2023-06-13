# frozen_string_literal: true

class EventLocation < ApplicationRecord
  belongs_to :event
  validates :address, presence: true
end
