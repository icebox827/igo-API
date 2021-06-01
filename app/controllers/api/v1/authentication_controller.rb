module Api
  module V1
    class AuthenticationController < ApplicationController
      def login
        @user = User.find_by(params[:username])

        if !@user
          render json: { message: 'Invalide username'}
        elsif @user.authenticate(params[:password])
          secret_key = Rails.application.secrets.secret_key_base[0]

          token = JWT.encode({ user_id: @user.id, uername: @user.username }, secret_key)

          render json: { token: token }
        else
          render json: { message: 'Invalid password' }
        end
      end
    end

  end
end
