class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets, id: :uuid do |t|
      t.string :type, null: false
      t.boolean :availability, default: true
      t.string :pricing
      t.belongs_to :event, type: :uuid

      t.timestamps
    end

    add_index :tickets, :type
    add_index :tickets, [:type, :event_id], unique: true
  end
end
