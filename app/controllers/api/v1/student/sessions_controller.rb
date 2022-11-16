    class Api::V1::Student::SessionsController < ApplicationController

      def create
        @student = Student.find_by_email(student_params[:email])
        if @student&.authenticate(student_params[:password])
          render json: {
            token: JsonWebToken.encode(student_id: @student.id),
            name: @student.name,
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

      def student_params
        params.require(:session).permit(:email, :password)
      end

    end
