module Api
  module V1
    class TimetablesController < ApplicationController
      before_action :current_admin, only: [:create]

      def create
        @timetable = Classroom.new(timetable_params)
        if @timetable.save
          render status: :created
        else
          render status: :unprocessable_entity
        end
      end

      private

      def timetable_params
        params.permit(:week_day, :starts_at, :ends_at)
      end

    end

  end
end

