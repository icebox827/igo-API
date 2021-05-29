module Api
  module V1
    class BookedCarsController < ApplicationController
      def index
        booked_cars = BookedCar.all
        render json: BookedCarsSerializer.new(booked_cars).serialized_json
      end

      def show
        booked_car = BookedCar.find(params[:id])
        render json: BookedCarsSerializer.new(booked_car).serialized_json
      end

      def new
        booked_car = Booked_car.new
        render json: BookedCarsSerializer.new(booked_car).serialized_json
      end

      def create
        booked_car = Booked_car.create(booked_car_params)

        if booked_car.save
          @user = User.find(params[:user_id])
          render json: BookedCarsSerializer.new(booked_car).serialized_json
        else
          render json: { error: car.errors.messages }, status: 422
        end
      end

      def update
        booked_car = Booked_car.find(params[:id])

        if booked_car.update
          render json: BookedCarsSerializer.new(booked_car).serialized_json
        else
          render json: { error: car.errors.messages }, status: 422
        end
      end

      def destroy
        booked_car = Booked_car.find(params[:id])

        if booked_car.destroy
          head :no_content
        else
          render json: { error: car.errors.messages }, status: 422
        end
      end

      private

      def booked_car_params
        params.require(:booked_car).permit(:user_id, :car_id)
      end
    end
  end
end
