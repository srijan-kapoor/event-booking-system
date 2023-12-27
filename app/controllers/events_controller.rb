class EventsController < ApplicationController
  before_action :authenticate_event_organizer
  before_action :set_event, only: [:show, :update, :destroy]

  def index
    events = current_user.events.all
    render json: events
  end

  def create
    @event = current_user.events.create(event_params)

    if @event.save
      render json: @event.to_json(include: {tickets: { methods: :type }}), status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @event
  end

  def update
    if @event.update(event_params)
      EventUpdateNotificationJob.perform_async(@event.id)
      render json: @event.to_json(include: {tickets: { methods: :type }})
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    render json: { "message": "Event deleted successfully." }, status: :no_content
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :venue, :description, tickets_attributes: [ :id, :type, :pricing, :availability ])
  end

  def authenticate_event_organizer
    render json: { "error": "Unauthorized" }, status: :unauthorized unless current_user_is_event_organizer?
  end

  def set_event
    @event = Event.find_by(id: params[:id])
    unless @event
      render json: { error: 'Event not found' }, status: :not_found
    end
  end
end