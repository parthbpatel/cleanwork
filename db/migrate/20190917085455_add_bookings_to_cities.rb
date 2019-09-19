class AddBookingsToCities < ActiveRecord::Migration[6.0]
  def change
    add_reference :cities, :bookings, foreign_key: true

  end
end
