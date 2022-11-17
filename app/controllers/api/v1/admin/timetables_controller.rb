    class Api::V1::Admin::TimetablesController < ApplicationController
      before_action :authenticate_admin!, only: [:create]
      before_action :sanitize_week_day, only: [:create]

      def create
        @timetable = Timetable.new(timetable_params)
        if @timetable.save
          render status: :created
        else
          render status: :unprocessable_entity
        end
      end

      private

      def sanitize_week_day
        params[:week_day] = params[:week_day].to_i unless params[:week_day].blank?
      end

      def timetable_params
        params.permit(:week_day, :starts_at, :ends_at)
      end

    end

