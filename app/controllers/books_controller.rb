class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]
    

    def book
        @q = Book.ransack(params[:q])
        @books = @q.result(distinct: true).page(params[:page])
    end

    def show
    end

    def index
        @q = Book.ransack(params[:q])
        @books = @q.result(distinct: true).page(params[:page])
        
        
    end

    def home 
    end

    def new
        @book = Book.new

    end
    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to books_path, notice: 'books was successfully created.'
        else
            flash.now[:alert] = 'books cannot be created.'
            render :new
        end
    end

    def edit
    end

    def update
        if @book.update(book_params)
            redirect_to books_path, notice: 'Books was successfully updated.'
        else
            flash.now[:alert] = 'Books cannot be created.'
            render :edit
        end
    end

    def destroy
        @book.destroy
        redirect_to books_url, notice: 'Book was seccessfully destroyed'
    end
    
    private
    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:title, :author, :given, :return, :status)
    end
end