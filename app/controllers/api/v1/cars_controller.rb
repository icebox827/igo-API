module Api
  module V1
    class CarsController < ApplicationController
      def index
        cars = Car.all
        render json: CarsSerializer.new(cars).serialized_json
      end

      def show
        car = Car.find(params[:id])
        render json: CarsSerializer.new(car).serialized_json
      end

      def new
        car = Car.new(car_params)
        render json: CarsSerializer.new(car).serialized_json
      end

      def create
        car = Car.new(car_params)

        if car.save
          render json: CarsSerializer.new(car).serialized_json
        else
          render json: { error: car.errors.messages }, status: 422
        end
      end

      def update
        car = Car.find(params[:id])

        if car.update
          render json: CarsSerializer.new(car).serialized_json
        else
          render json: { error: car.errors.messages }, status: 422
        end
      end

      def destroy
        car = Car.find(params[:id])

        if car.destroy
          head :no_content
        else
          render json: { error: car.errors.messages }, status: 422
        end
      end

      private

      def car_params
        params.require(:car).permit(:make, :model, :year, :color, :transmission, :seats, :image_url)
      end
    end
  end
end
