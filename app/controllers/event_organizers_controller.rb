class EventOrganizersController < ApplicationController

  def create
    @event_organizer = EventOrganizer.create(event_organizer_params)

    if @event_organizer.save
      render json: @event_organizer, status: :created
    else
      render json: @event_organizer.errors, status: :unprocessable_entity
    end
  end

  def login
    @event_organizer = EventOrganizer.find_by_email(params[:event_organizer][:email])

    if @event_organizer && @event_organizer.authenticate(params[:event_organizer][:password])
      render json: @event_organizer
    else
      render json: {error: 'Invalid credentials email or password'}, status: :unauthorized
    end
  end

  private

  def event_organizer_params
    params.require(:event_organizer).permit(:name, :email, :password, :password_confirmation)
  end
end