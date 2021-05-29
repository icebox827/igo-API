class CarsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :make, :model, :year, :color, :transmission, :seats, :image_url, :user_id
end
