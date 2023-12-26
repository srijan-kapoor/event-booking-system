class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :type, default: 0
      t.boolean :availability, default: false
      t.string :pricing
      t.belongs_to :event

      t.timestamps
    end

    add_index :tickets, :type
  end
end
