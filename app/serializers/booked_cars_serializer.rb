class BookedCarsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :car_id
end
