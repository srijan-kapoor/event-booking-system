class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events, id: :uuid do |t|
      t.string :name
      t.datetime :date
      t.string :venue
      t.string :description
      t.belongs_to :event_organizer, type: :uuid

      t.timestamps
    end
    add_index :events, :name, unique: true
  end
end
