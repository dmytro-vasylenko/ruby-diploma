module Api
  module V1
    class VisitorsController < ApplicationController
      before_action :set_visitor, only: [:show, :update, :destroy]

      # GET /visitors
      def index
        @visitors = Visitor.all

        render json: @visitors
      end

      # GET /visitors/1
      def show
        render json: @visitor
      end

      # POST /visitors
      def create
        @visitor = Visitor.new(visitor_params)

        if @visitor.save
          render json: @visitor, status: :created, location: @visitor
        else
          render json: @visitor.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /visitors/1
      def update
        if @visitor.update(visitor_params)
          render json: @visitor
        else
          render json: @visitor.errors, status: :unprocessable_entity
        end
      end

      # DELETE /visitors/1
      def destroy
        @visitor.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_visitor
          @visitor = Visitor.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def visitor_params
          params.require(:visitor).permit(:device_id, :visit_date, :institutionId)
        end
    end
  end
end
