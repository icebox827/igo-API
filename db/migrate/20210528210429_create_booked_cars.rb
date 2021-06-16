class CreateBookedCars < ActiveRecord::Migration[6.1]
  def change
    create_table :booked_cars do |t|
      t.integer :user_id
      t.integer :car_id

      t.timestamps
    end
    add_index :booked_cars, :user_id
    add_index :booked_cars, :car_id
  end
end
