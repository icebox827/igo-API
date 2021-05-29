class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: true }, length: { in: 3..20 }
  validates :password, presence: true, length: { minimum: 8 }

  has_many :cars
  has_many :booked_cars, dependent: :destroy
end
