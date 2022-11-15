module Api
  module V1
    class RegistrationsController < ApplicationController
      def create
        @user = User.new(user_params)
        if @user.save
          render json:
                   {
                     user: @user,
                     status: :created
                   }
        else
          render json:
                   {
                     user: @user.errors,
                     status: :unprocessable_entity
                   }
        end
      end

      def show
        user = User.find(params[:id])
      end
      private

      def user_params
        params.permit( :name, :surname, :grade, :section, :email, :password, :password_confirmation)
      end
    end
  end
end
