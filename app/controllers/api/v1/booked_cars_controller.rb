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

      def create
        @booked_car = BookedCar.new(
          user_id: @user.id,
          car_id: params[:car_id]
        )

        if @booked_car.save
          render json: @booked_car, status: :created
        else
          render json: { error: @booked_car.errors.messages }, status: 422
        end
      end

      def update
        @booked_car = BookedCar.find(params[:id])

        if @booked_car.update
          render json: @booked_car, status: :updated
        else
          render json: { error: @booked_car.errors.messages }, status: 422
        end
      end

      def destroy
        @booked_car = BookedCar.find(params[:id])

        if @booked_car.destroy
          render json: { status: 'success' }
        else
          render json: { error: @booked_car.errors.messages }, status: 422
        end
      end

    end
  end
end
