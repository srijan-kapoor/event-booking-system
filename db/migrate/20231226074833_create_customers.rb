class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers, id: :uuid do |t|
      t.string :email
      t.string :name
      t.string :password_digest

      t.timestamps
    end

    add_index :customers, :email, unique: true
  end
end
