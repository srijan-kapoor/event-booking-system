class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.belongs_to :customer
      t.belongs_to :event
      t.belongs_to :ticket

      t.timestamps
    end
  end
end
