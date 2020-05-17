module Api
  module V1
    class InstitutionsController < ApplicationController
      before_action :set_institution, only: [:show, :update, :destroy]

      def index
        @institutions = Institution.all

        render json: @institutions
      end

      def show
        render json: @institution
      end

      def create
        @institution = Institution.new(institution_params)

        if @institution.save
          render json: @institution, status: :created, location: @institution
        else
          render json: @institution.errors, status: :unprocessable_entity
        end
      end

      def update
        if @institution.update(institution_params)
          render json: @institution
        else
          render json: @institution.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @institution.destroy
      end

      private
        def set_institution
          @institution = Institution.find(params[:id])
        end

        def institution_params
          params.require(:institution).permit(:name, :location, :administrator, :description)
        end
    end
  end
end
