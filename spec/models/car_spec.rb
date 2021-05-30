require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:make) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:color) }
    it { should validate_presence_of(:transmission) }
    it { should validate_presence_of(:image_url) }
    it { should validate_presence_of(:seats) }
  end

  describe 'associations' do
    it { should have_many(:booked_cars) }
    it { should belongs_to(:user) }
  end
end
