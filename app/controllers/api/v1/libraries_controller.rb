module Api
  module V1
    class LibrariesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_library, only: %i[show edit update destroy]

      # GET /libraries or /libraries.json
      def index
        @libraries = Library.all
        render json: { status: 'success', message: 'Loaded libraries', data: @libraries }, status: :ok
      end

      # GET /libraries/1 or /libraries/1.json
      def show
        render json: { status: 'success', message: 'Loaded library', data: @library }, status: :ok
      end

      # POST /libraries or /libraries.json
      def create
        @library = Library.new(library_params)
        if @library.save
          render json: { status: 'success', message: 'Library created', data: @library }, status: :ok
        else
          render json: { status: 'error', message: 'failed to create library', data: @library.errors },
                 status: :unprocessable_entity
        end
      end

      # PATCH/PUT /libraries/1 or /libraries/1.json
      def update
        if @library.update(library_params)
          render json: { status: 'success', message: 'updated libraries', data: @library }, status: :ok
        else
          render json: { status: 'error', message: 'failed to update library', data: @library.errors },
                 status: :unprocessable_entity
        end
      end

      # DELETE /libraries/1 or /libraries/1.json
      def destroy
        @library.destroy
        render json: { status: 'success', message: 'deleted book', data: @libraries }, status: :ok
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_library
        @library = Library.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def library_params
        params.require(:library).permit(:name, :address)
      end
    end
  end
end
