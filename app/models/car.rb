class Car < ApplicationRecord
  validates :make, :model, :year, :color, :transmission, :seats, :image_url, presence: true

  belongs_to :user
  has_many :booked_cars dependent: :destroy
end
