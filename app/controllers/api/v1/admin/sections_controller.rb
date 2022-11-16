    class Api::V1::Admin::SectionsController < ApplicationController

      def index
        @sections = Section.all
      end
    end

