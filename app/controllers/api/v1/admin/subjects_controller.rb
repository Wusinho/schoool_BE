    class Api::V1::Admin::SubjectsController < ApplicationController
      before_action :authenticate_admin!, only: [:create]

      def create
        @subject = Subject.new(subject_params)
        if @subject.save
          render status: :created
        else
          render status: :unprocessable_entity
        end
      end

      private

      def subject_params
        params.permit(:name, :times_week, :classroom_id, :course_id, :teacher_id)
      end

    end
