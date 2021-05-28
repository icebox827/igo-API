module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all

        render json: UsersRepresenter.new(users).as_json
      end

      def create
        @user = User.create(user_params)

        if @user.save
          render json: UsersRepresenter.new(users).as_json, status: :created
        else
          render json: { error: 'Not created' }, status: :Not_processed
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :password)
      end
    end
  end
end
