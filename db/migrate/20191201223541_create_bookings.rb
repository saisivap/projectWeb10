class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :items
      t.references :user, foreign_key: true
      t.float :total

      t.timestamps
    end
  end
end
