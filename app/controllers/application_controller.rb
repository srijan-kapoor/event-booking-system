class ApplicationController < ActionController::API
  include ActionController::Cookies

  def current_user
    EventOrganizer.find_by(id: session[:user_id]) || Customer.find_by(id: session[:user_id])
  end

  def current_user_is_customer?
    current_user.instance_of? Customer
  end

  def current_user_is_event_organizer?
    current_user.instance_of? EventOrganizer
  end
end
