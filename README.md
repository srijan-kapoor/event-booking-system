# Event Booking System

A simple backend for an event booking system

![Entity Relationship Diagram](./event_booking.jpg)
* Ruby version: 2.7.2
* Rails version: 6
* Database: Postgresql (pg '>= 0.18')

* Project Setup
  - Clone the repo
  ```
  git clone https://github.com/srijan-kapoor/event-booking-system.git
  ```
  - Move to directory
  ```
  cd event-booking-system
  ```
  - Run setup
  ```
  bin/setup
  ```
  - Start the server
  ```
  bundle exec rails s
  ```

* Services

  We are using `sidekiq` to trigger background jobs.
  A separate instance of sidekiq needs to be started to process these jobs.
  ```
    bundle exec sidekiq
  ```

### Directory Structure
![Code Structure](./code_structure.png)

The controller actions for signing up and logging the users can be found under `/controllers/event_organizers_controller.rb` and `/controllers/customers_controller.rb`

For event bookings `/controllers/bookings_controller.rb`

For creating events `/controllers/events_controller.rb`

This project makes use of STI for `Ticket` types. The following types of tickets are present at this point:

```
General
Vip
Reserved
Member
Freebie
```


### Autonomy and Time Management

- Project setup: Set a new Rails API only application with postgresql
- Design: 
  - Create a schema diagram depicting relationship between database entities
  - Based on the ER diagram, setup models, database(tables) and build necessary associations

- Authentication: Implement signup and login for two kinds of users: Event Organizers and Customers.
- Build APIs and corresponding controllers:
This includes designing the API endpoints, handling requests/ responses, and error handling.
  - Events: APIs to create, read, update, and delete events
  - Booking: Allow customers to book tickets

- Role-based Authorization: Restrict API access based on the user role: Event Organizer and Customer

- Background Tasks: Implement the Sidekiq jobs to send booking confirmations when a ticket is booked and to send email event update notifications to customers who have booked tickets for an event that gets updated.

### API Collection
A postman collection can be found [here](https://github.com/srijan-kapoor/event-booking-system/blob/0b558abfc192e44f7afcce9d8114427eb176eb28/event-booking-system.postman_collection.json) for testing the API locally.
