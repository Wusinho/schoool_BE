module Api
  module V1
    class SectionsController < ApplicationController

      def index
        @sections = Section.all
      end


    end

  end
end

