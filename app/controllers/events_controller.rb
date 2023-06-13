# frozen_string_literal: true

class EventsController < ApplicationController
  include EventsHelper
  before_action :event, only: %i[show edit update destroy]

  # returns selfncreated events
  def my_events
    @events = current_user.events
  end

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show; end

  # GET /events/new
  def new
    @event = Event.new
    @event.build_event_location
  end

  # GET /events/1/edit
  def edit; end

  def create
    @event = EventCreator.call(event_params)

    if @event.present?
      redirect_to event_url(@event), notice: 'Event was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  rescue StandardError => e
    flash[:alert] = "Error: #{e.message}"
    redirect_to new_event_url
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    if EventUpdater.call(event_params, @event)
      redirect_to event_url(@event), notice: 'Event was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  rescue StandardError => e
    flash[:alert] = "Error: #{e.message}"
    redirect_to edit_event_url(@event.id)
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
    end
  rescue StandardError
    redirect_to events_url, alert: 'An error occurred while destroying the event.'
  end

  def search
    @events = EventSearch.call(params[:search])
  rescue StandardError => e
    @events = []
    flash[:alert] = "An error occurred while searching for events: #{e.message}"
    redirect_to events_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def event
    @event ||= Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to events_url, alert: 'Event not found.'
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :description, :user_id, :start_date_time, :end_date_time,
                                  event_location_attributes: {})
  end
end
