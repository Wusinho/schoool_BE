    class Api::V1::Admin::ClassroomsController < ApplicationController
      before_action :current_admin, only: [:create]

      def create
        @classroom = Classroom.new(classroom_params)
        if @classroom.save
          render status: :created
        else
          render status: :unprocessable_entity
        end
      end

      private

      def classroom_params
        params.permit(:edlevel_id, :section_id, :participants)
      end

    end

