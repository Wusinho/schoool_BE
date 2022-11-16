    class Api::V1::Admin::SubjectsController < ApplicationController
      before_action :current_admin, only: [:create]

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
        params.require(:subject).permit(:name, :participants, :times_week,
                                        subjectdate_attributes: [:timetable_id]
                                        )
      end

    end
