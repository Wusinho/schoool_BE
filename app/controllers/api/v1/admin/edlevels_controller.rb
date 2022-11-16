    class Api::V1::Admin::EdlevelsController < ApplicationController
      before_action :authenticate_admin!, only: [:create]
      before_action :sanitize_params, only: [:create]

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

      def sanitize_params
        params[:ed_level] = params[:ed_level].to_i
        params[:nivel]  = params[:nivel].to_i
      end

      def edlevel_params
        params.permit(:ed_level, :nivel)
      end

    end

