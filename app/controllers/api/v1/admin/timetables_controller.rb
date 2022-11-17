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
        params[:starts_at] = params[:starts_at].to_i unless params[:starts_at].blank?
        params[:ends_at] = params[:ends_at].to_i unless params[:ends_at].blank?
      end

      def timetable_params
        params.permit(:week_day, :starts_at, :ends_at)
      end

    end

