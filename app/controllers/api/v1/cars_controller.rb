module Api
  module V1
    class CarsController < ApplicationController
      before_action :authenticate, only: [:create]

      def index
        @cars = Car.all
        render json: @cars
      end

      def show
        @car = Car.find(params[:id])
        render json: @car
      end

      def create
        @car = Car.new(
          make: params[:make],
          model: params[:model],
          year: params[:year],
          color: params[:color],
          transmission: params[:transmission],
          image_url: params[:image_url],
          seats: params[:seats],
          user_id: @user.id
        )

        if @car.save
          render json: @car, status: :created
        else
          render json: { error: @car.errors.messages }, status: 422
        end
      end

      def update
        @car = Car.find(params[:id])

        if @car.update
          render json: @car, status: :updated
        else
          render json: { error: @car.errors.messages }, status: 422
        end
      end

      def destroy
        @car = Car.find(params[:id])

        if @car.destroy
          render json: { status: 'success' }
        else
          render json: { error: car.errors.messages }, status: 422
        end
      end
    end
  end
end
