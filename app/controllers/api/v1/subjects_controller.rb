module Api
  module V1
    class SubjectsController < ApplicationController

      def create

      end

      private

      def subject_params
        params.require(:subject).permit(:name, :participants, :times_week,
                                        subjectdate_attributes: [:week_day, :starts_at, :ends_at]
                                        )
      end

    end
  end
end
