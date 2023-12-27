class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :type, null: false
      t.boolean :availability, default: true
      t.string :pricing
      t.belongs_to :event

      t.timestamps
    end

    add_index :tickets, :type
    add_index :tickets, [:type, :event_id], unique: true
  end
end
