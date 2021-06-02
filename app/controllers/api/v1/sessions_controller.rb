module Api
  module V1
    class SessionsController < ApplicationController
      def new; end

      def create
        @user = User.find_by(username: params[:session][:user])

        if @user
          session[:user_id] = @user.id
          session[:username] = @user.username
          render json: { message: 'Login successfully' }
        else
          render json: { error: 'Invalid user' }, status: 404
        end
      end

      def destroy
        reset_session
        flash[:success] = 'Logout succesfully'
      end
    end
  end
end
