class BookedCar < ApplicationRecord
  validates_uniqueness_of :car, scope: :user_id, message: 'Car has already been booked'

  belongs_to :user
  belongs_to :car
end
