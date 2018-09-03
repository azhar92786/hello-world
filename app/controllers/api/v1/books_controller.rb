class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  

  # GET /books
  # GET /books.json
  def index
    @books = Book.limit(100).order(:id)
    render json: {status: 'SUCCESS', message: 'Loaded all books', data: @books}, status: :ok
  end

  # GET /books/1
  # GET /books/1.json
  def show
    render json: {status: 'SUCCESS', message: 'Loaded specific book with ID', data: @book}, status: :ok
  end

   # POST /books
   def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    @book.categories.clear
    #set_categories
    if @book.update(book_params)
       render json: @book, status: :created, location: @book
      else
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
   end


   def borrow
    @book = Book.find(params[:book_id])
    @book.borrower.nil? ? [@book.update_attribute(:borrower, params[:borrower]), UserMailer.with(user: params[:borrower], book: @book).welcome_email.deliver_later ] : @book.update_attribute(:borrower, nil)
    render json: {status: 'SUCCESS', message: 'Loaded all books', data: @book}, status: :ok
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
