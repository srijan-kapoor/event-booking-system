class CreateEventOrganizers < ActiveRecord::Migration[6.0]
  def change
    create_table :event_organizers, id: :uuid do |t|
      t.string :email
      t.string :name
      t.string :password_digest

      t.timestamps
    end

    add_index :event_organizers, :email, unique: true
  end
end
