module Api
  module V1
    class BookedCarsController < ApplicationController
      before_action :authenticate, only: [:create]
      
      def index
        @booked_cars = BookedCar.all
        render json: @booked_cars
      end

      def show
        @booked_car = BookedCar.find(params[:id])
        render json: @booked_car
      end

      def new
        @booked_car = BookedCar.new
        render json: @booked_car
      end

      def create
        @booked_car = BookedCar.create(booked_car_params)

        if booked_car.save
          @user = User.find(params[:user_id])
          render json: @booked_car, status: :created
        else
          render json: { error: car.errors.messages }, status: 422
        end
      end

      def update
        @booked_car = BookedCar.find(params[:id])

        if @booked_car.update
          render json: @booked_car, status: :updated
        else
          render json: { error: car.errors.messages }, status: 422
        end
      end

      def destroy
        @booked_car = BookedCar.find(params[:id])

        if @booked_car.destroy
          render json: { status: 'success' }
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
