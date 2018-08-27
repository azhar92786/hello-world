class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  

  # GET /books
  # GET /books.json
  def index
    @books = Book.limit(100)
    render json: {status: 'SUCCESS', message: 'Loaded all books', data: @books}, status: :ok
  end

  # GET /books/1
  # GET /books/1.json
  def show
    render json: {status: 'SUCCESS', message: 'Loaded specific book with ID', data: @book}, status: :ok
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params    
     params.require(:book).permit(:title, :description, :image, :borrower, :categories)
  
    end
end
