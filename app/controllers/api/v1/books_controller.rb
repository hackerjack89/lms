module Api
  module V1
    class BooksController < ApplicationController
      before_action :authenticate_user!
      before_action :set_book, only: %i[show edit update destroy lend return_lended_book]

      def index
        @books = Book.all
        render json: {
          status: 'success',
          message: 'Loaded books',
          data: @books
        }, status: :ok
      end

      def show
        render json: {
          status: 'success',
          message: 'Loaded book',
          data: @book
        }, status: :ok
      end

      def create
        @book = Book.new(book_params)
        if @book.save
          render json: {
            status: 'success',
            message: 'Book created',
            data: @book
          }, status: :ok
        else
          render json: {
            status: 'error',
            message: 'failed to create book',
            data: @book.errors
          }, status: :unprocessable_entity
        end
      end

      def update
        if @book.update(book_params)
          render json: {
            status: 'success',
            message: 'updated book',
            data: @book
          }, status: :ok
        else
          render json: {
            status: 'error',
            message: 'failed to update library',
            data: @book.errors
          }, status: :unprocessable_entity
        end
      end

      def destroy
        @book.destroy
        render json: {
          status: 'success',
          message: 'deleted book',
          data: @book
        }, status: :ok
      end

      def lend
        puts 'in lend route'
        @book.borrowed_by_id = params[:user_id]
        @book.status = 1

        if @book.save
          render json: {
            status: 'success',
            message: 'Book lended successfully',
            data: @book
          }, status: :ok
        else
          render json: {
            status: 'error',
            message: 'failed to lend book',
            data: @book.errors
          }, status: :unprocessable_entity
        end
      end

      def return_lended_book
        @book.borrowed_by_id = nil
        @book.status = 0
        if @book.save
          render json: {
            status: 'success',
            message: 'Book returned successfully',
            data: @book
          }, status: :ok
        else
          render json: {
            status: 'error',
            message: 'failed to get return book',
            data: @book.errors
          }, status: :unprocessable_entity
        end
      end

      private

      def set_book
        @book = Book.find(params[:id])
      end

      def book_params
        params.require(:book).permit(:name, :author, :price, :library_id, :status)
      end
    end
  end
end
