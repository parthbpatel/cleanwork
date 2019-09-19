class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :cleaner, index: true, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
