module Api
  module V1
    class CoursesController < ApplicationController
      before_action :current_admin, only: [:create]

      def index
        @courses = Course.all
      end

      def create
        @course = Course.new(courses_params)
        if @course.save
          render status: :created
        else
          render status: :unprocessable_entity
        end
      end

      private

      def courses_params
        params.permit(:name)
      end

    end

  end
end

