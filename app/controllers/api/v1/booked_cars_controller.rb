module Api
  module V1
    class BookedCarsController < ApplicationController
      before_action :authenticate, only: %i[create index]

      def index
        if @user.admin == true
          render json: BookedCar.all, include: %i[car user]
        else
          render json: @user.cars
        end
      end

      def show
        @booked_car = BookedCar.find(params[:id])
        render json: @booked_car
      end

      def create
        @booked_car = @user.booked_cars.build(booking_params)

        if @booked_car.save
          render json: { message: 'Car booked succesfully' }, status: :created
        else
          render json: { error: @booked_car.errors.messages }, status: 422
        end
      end

      def update
        @booked_car = BookedCar.find(params[:id])

        if @booked_car.update(booking_params)
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

      private

      def booking_params
        params.require(:booked_car).permit(:car_id)
      end
    end
  end
end
