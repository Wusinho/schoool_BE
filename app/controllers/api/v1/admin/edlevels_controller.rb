    class Api::V1::Admin::EdlevelsController < ApplicationController
      before_action :current_admin, only: [:create]

      def index
        @edlevels = Edlevel.all
      end

      def create
        @edlevel = Edlevel.new(edlevel_params)
        if @edlevel.save
          render status: :created
        else
          render status: :unprocessable_entity
        end
      end

      private

      def edlevel_params
        params.permit(:name, :nivel)
      end

    end

