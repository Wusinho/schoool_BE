module Api
  module V1
    class RegistrationsController < ApplicationController
      def create
        @user = User.new(user_params)

        if @user
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end

      end

      def show
        user = User.find(params[:id])
      end
      private

      def user_params
        params.require(:user).permit( :name, :surname, :grade, :section, :email, :password)
      end
    end
  end
end
