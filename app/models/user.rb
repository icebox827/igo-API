class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: true }, length: { in: 3..20 }
  validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :email, with: /\A\S+@.+\.\S+\z/

  has_many :cars, dependent: :destroy
  has_many :booked_cars, dependent: :destroy
end
