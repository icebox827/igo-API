class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: true }, length: { in: 3..20 }
  validates :password, presence: true

  has_many :cars
end
