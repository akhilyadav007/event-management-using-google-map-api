# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user
  has_one :event_location, dependent: :destroy
  accepts_nested_attributes_for :event_location
  delegate :address, to: :event_location, allow_nil: true
  validates :name, presence: true
  validates :start_date_time, presence: true
  validates :end_date_time, presence: true
end
