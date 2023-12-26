class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :venue
      t.string :description
      t.belongs_to :event_organizer

      t.timestamps
    end
    add_index :events, :name, unique: true
  end
end
