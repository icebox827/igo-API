class BookedCarsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :car_id

  belongs_to :user
  belongs_to :car
end
