    class Api::V1::Admin::CoursesController < ApplicationController
      before_action :authenticate_admin, only: [:create]

      def index
        @courses = Course.all
      end

      def create
        @course = Course.new(courses_params)
        if @course.save
          render status: :created
        else
          render json:
                   {
                     error: @course.errors,
                     status: :unprocessable_entity
                   }
        end
      end

      private

      def courses_params
        params.permit(:name)
      end

    end

