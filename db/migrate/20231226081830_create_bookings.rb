class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings, id: :uuid do |t|
      t.belongs_to :customer, type: :uuid
      t.belongs_to :event, type: :uuid
      t.belongs_to :ticket, type: :uuid

      t.timestamps
    end
  end
end
