module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
        render json: @users
      end

      def show
        @user = User.find(params[:id])
        render json: @user
      end

      def create
        user = User.create(user_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: { error: user.errors.messages }, status: 422
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :email, :password)
      end

      def cars
        @cars ||= { include: %i[cars] }
      end
    end
  end
end
