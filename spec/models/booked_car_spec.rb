require 'rails_helper'

RSpec.describe BookedCar, type: :model do
  describe 'associations' do
    it { should belongs_to(:user) }
    it { should belongs_to(:car) }
  end
end
