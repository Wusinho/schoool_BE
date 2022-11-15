module Api
  module V1
    class SessionsController < ApplicationController

      def create
        @user = User.find_by_email(user_params[:email])
        if @user&.authenticate(user_params[:password])
          render json: {
            token: JsonWebToken.encode(user_id: @user.id),
            name: @user.name,
            status: :created
          }
        else
          render json: {
            error: 'Wrong email/password',
            status: :not_found
          }
        end
      end

      private

      def user_params
        params.require(:session).permit(:email, :password)
      end

    end
  end
end
