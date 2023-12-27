class EventsController < ApplicationController
  before_action :authenticate_event_organizer!

  def create
    @event = current_user.events.create(event_params)

    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :venue, :description, tickets_attributes: [ :type, :pricing, :availability ])
  end

  def authenticate_event_organizer!
    head :unauthorized unless current_user_is_event_organizer?
  end
end