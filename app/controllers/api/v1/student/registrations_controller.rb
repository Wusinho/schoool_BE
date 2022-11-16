    class Api::V1::Student::RegistrationsController < ApplicationController
      def create
        @student = Student.new(student_params)
        if @student.save
          render json:
                   {
                     token: JsonWebToken.encode(student_id: @student.id),
                     name: @student.name,
                     status: :created
                   }

        else
          render json:
                   {
                     error: @student.errors,
                     status: :unprocessable_entity
                   }
        end
      end

      def show
        student = Student.find(params[:id])
      end
      private

      def student_params
        params.permit(:name, :surname, :grade, :section, :email, :password, :password_confirmation, :classroom_id)
      end
    end
