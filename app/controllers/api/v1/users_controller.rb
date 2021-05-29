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
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: { message: @user.error.full_message }, status: :Not_processed
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :password)
      end
    end
  end
end
