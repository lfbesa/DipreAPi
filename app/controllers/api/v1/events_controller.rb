module Api
  module V1
    class EventsController < ApplicationController
      before_action :set_event, only: [:show, :update, :destroy]
      before_action :authenticate_token

      # GET /events
      def index
        if @is_authenticated
          @events = Event.where("created_at >= ?", 60.days.ago).order(date: :desc)
          render json: @events
        else
          render status: 403, json: {
            message: "No TOKEN auth."
          }.to_json
        end
      end

      # GET /events/1
      def show
        if @is_authenticated
          render json: @event
        else
          render status: 403, json: {
            message: "No TOKEN auth."
          }.to_json
        end

      end

      # POST /events
      def create
        if @is_authenticated
          @event = Event.new(event_params)

          if @event.save
            render json: @event, status: :created, location: @event
          else
            render json: @event.errors, status: :unprocessable_entity
          end
        else
          render status: 403, json: {
            message: "No TOKEN auth."
          }.to_json
        end
      end

      # PATCH/PUT /events/1
      def update
        if @is_authenticated
          if @event.update(event_params)
            render json: @event
          else
            render json: @event.errors, status: :unprocessable_entity
          end
        else
          render status: 403, json: {
            message: "No TOKEN auth."
          }.to_json
        end
      end

      # DELETE /events/1
      def destroy
        if @is_authenticated
          @event.destroy
        else
          render status: 403, json: {
            message: "No TOKEN auth."
          }.to_json
        end
      end

      private
        #This is to authenticate that the call is set from an account of the front-end
        def authenticate_token
          @is_authenticated = false
          if request.headers["TOKEN"]
            if request.headers["TOKEN"] == "AppDipre"
              @is_authenticated = true
            end
          end
        end
        # Use callbacks to share common setup or constraints between actions.
        def set_event
          @event = Event.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def event_params
          params.require(:event).permit(:title, :description, :epigraph, :date, :to_date, :hour, :url)
        end
    end
  end
end
