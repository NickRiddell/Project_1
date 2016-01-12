class AddTicketToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :ticket, :integer
  end
end
