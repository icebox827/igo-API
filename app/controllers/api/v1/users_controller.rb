module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all
        render json: UsersSerializer.new(users).serialized_json
      end

      def show
        user = User.find(params[:id])
        render json: UsersSerializer.new(user).serialized_json
      end

      def create
        user = User.new(user_params)

        if @user.save
          render json: UsersSerializer.new(user).serialized_json
        else
          render json: { error: user.errors.messages }, status: 422
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :email, :password)
      end
    end
  end
end
