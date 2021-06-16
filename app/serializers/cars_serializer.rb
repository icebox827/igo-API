class CarsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :make, :model, :year, :color, :transmission, :seats, :image_url, :user_id

  belongs_to :user
  has_many :booked_cars, dependent: :destroy
end
