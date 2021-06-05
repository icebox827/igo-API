class AddFiledsToBookedCar < ActiveRecord::Migration[6.1]
  def change
    add_column :booked_cars, :make, :string
    add_column :booked_cars, :model, :string
    add_column :booked_cars, :year, :integer
    add_column :booked_cars, :color, :string
    add_column :booked_cars, :transmission, :string
    add_column :booked_cars, :seats, :string
    add_column :booked_cars, :image_url, :string
  end
end
