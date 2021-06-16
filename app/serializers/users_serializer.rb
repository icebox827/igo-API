class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :password, :email, :admin

  has_many :cars
  has_many :booked_cars
end
