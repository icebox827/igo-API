module Api
  module V1
    class BookedCarsController < ApplicationController
      def index
        @booked_cars = Booked_car.all
        render json: @booked_cars
      end

      def show
        @booked_car = Booked_car.find(params[:id])
        render json: @booked_car
      end
    end
  end
end
