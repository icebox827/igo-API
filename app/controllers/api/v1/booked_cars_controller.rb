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

      def new
        @booked_car = Booked_car.new
        render json: @booked_car
      end

      def create
        @booked_car = Booked_car.create(booked_car_params)

        if @booked_car.save
          @user = User.find(params[:user_id])
          render json: @booked_car, status: :created
        else
          render json: { message: 'Cannot booked that car' }, status: :Not_processed
        end
      end

      def update
        @booked_car = Booked_car.find(params[:id])

        if @booked_car.update
          render json: @booked_car, status: :updated
        else
          render json: { message: 'Cannot update' }, status: :Not_processed
        end
      end

      def destroy
        @booked_car = Booked_car.find(params[:id])

        if @booked_car.destroy
          render json: @booked_car, status: :destroyed
        else
          render json: { message: 'Cannot destroy' }, status: :Not_processed
        end
      end

      private

      def booked_car_params
        params.require(:booked_car).permit(:user_id, :car_id)
      end
    end
  end
end
