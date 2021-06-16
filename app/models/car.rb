class Car < ApplicationRecord
  validates :make, :model, :year, :color, :transmission, :seats, :image_url, presence: true

  has_many :booked_cars
  has_many :users, through: :booked_cars
end
