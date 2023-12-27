class BookingConfirmationJob
  include Sidekiq::Job

  def perform(booking_id)
    Rails.logger.info "Sending Email confirmation for booking #{booking_id}"
  end
end
