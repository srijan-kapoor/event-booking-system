class BookingsController < ApplicationController
  before_action :authenticate_customer

  def create
    @booking = current_user.bookings.create(booking_params)

    if @booking.save
      render json: @booking, status: :created
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:event_id, :ticket_id)
  end

  def authenticate_customer
    render json: { "error": "Unauthroized" }, status: :unauthorized unless current_user_is_customer?
  end
end