module Api
  module V1
    class TeachersController < ApplicationController
      def create
        @teacher = Teacher.find_by_email(teacher_params[:email])
        if @teacher&.authenticate(teacher_params[:password])
          render json: {
            token: JsonWebToken.encode(teacher_id: @teacher.id),
            name: @teacher.name,
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

  end
end

