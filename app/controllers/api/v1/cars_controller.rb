module Api
  module V1
    class CarsController < ApplicationController
      def index
        @cars = Car.all

        render json: @cars
      end

      private

      def car_params
        params.require(:car).permit(:make, :model, :year, :color, :transmission, :seats, :image_url)
      end
    end
  end
end
