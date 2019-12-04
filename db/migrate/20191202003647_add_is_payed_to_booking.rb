class AddIsPayedToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :is_payed, :boolean,default: false
  end
end
