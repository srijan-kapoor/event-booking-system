class EventUpdateNotificationJob
  include Sidekiq::Job

  def perform(event_id)
    Rails.logger.info "Sending Email for the updated event to all customers #{event_id}..."
  end
end