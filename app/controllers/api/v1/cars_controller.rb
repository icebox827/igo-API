module Api
  module V1
    class CarsController < ApplicationController
      def index
        @cars = Car.all
        render json: @cars
      end

      def show
        @car = Car.find(params[:id])
        render json: @car
      end

      def new
        @car = Car.new(car_params)
        render json: @car
      end

      def create
        @car = Car.create(car_params)

        if @car.save
          render json: @car, status: :created
        else
          render json: { message: @car.error.full_message }, status: :Not_processed
        end
      end

      def update
        @car = Car.find(params[:id])

        if @car.update
          render json: @car, status: :updated
        else
          render json: { message: @car.error.full_message }, status: :Not_processed
        end
      end

      def destroy
        @car = Car.find(params[:id])

        if @car.destry
          render json: @car, status: :destroyed
        else
          render json: { message: @car.error.full_message }, status: :Not_processed
        end
      end

      private

      def car_params
        params.require(:car).permit(:make, :model, :year, :color, :transmission, :seats, :image_url)
      end
    end
  end
end
