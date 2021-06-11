module Api
  module V1
    class AuthenticationController < ApplicationController
      def create
        @user = User.find_by(username: params[:username])
        if !@user
          render json: { error: 'Invalid username' }, status: 403
        elsif @user.authenticate(params[:password])
          # secret_key = ENV['SECRET_KEY']
          secret_key = '5496fs6a6rgra6g1'
          token = JWT.encode({ user_id: @user.id, username: @user.username }, secret_key)

          render json: { token: token, admin: @user.admin }, status: :ok
        else
          render json: { error: 'Invalid password' }, status: 403
        end
      end
    end
  end
end
