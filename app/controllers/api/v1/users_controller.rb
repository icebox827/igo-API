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
        @user = User.create(
          username: params[:username],
          email: params[:email],
          password: params[:password]
        )

        if @user.save
          render json: @user, status: :created
        else
          render json: { error: @user.errors.messages }, status: 422
        end
      end
    end
  end
end
