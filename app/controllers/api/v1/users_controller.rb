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
        @user.password = params[:password]
        if @user.save
          render json: { message: 'User created successfully' }, status: :ok
        else
          render json: { error: @user.errors.full_messages }, status: 422
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :email)
      end
    end
  end
end
