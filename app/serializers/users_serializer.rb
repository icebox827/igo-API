class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :password

  has_many :cars
  has_many :booked_cars, dependent: :destroy
end
