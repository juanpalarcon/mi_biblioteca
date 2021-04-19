class HomeController < ApplicationController
    def index
        @books = Book.shelf.page(params[:page])
    end
end