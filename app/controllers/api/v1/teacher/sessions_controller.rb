    class Api::V1::Teacher::SessionsController < ApplicationController
      def create
        @teacher = Teacher.find_by_email(teacher_params[:email])
        if @teacher&.authenticate(teacher_params[:password])
          render json: {
            token: JsonWebToken.encode(teacher_id: @teacher.id),
            name: @teacher.name,
            user_type: Teacher.to_s,
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
      def teacher_params
        params.permit(:email, :password)
      end

    end
