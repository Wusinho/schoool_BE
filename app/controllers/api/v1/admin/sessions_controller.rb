    class Api::V1::Admin::SessionsController < ApplicationController
      def create
        @admin = Admin.find_by_email(admin_params[:email])
        if @admin&.authenticate(admin_params[:password])
          render json: {
            token: JsonWebToken.encode(admin_email: @admin.email),
            name: @admin.name,
            user_type: Admin.to_s,
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
      def admin_params
        params.permit(:email, :password)
      end

    end
