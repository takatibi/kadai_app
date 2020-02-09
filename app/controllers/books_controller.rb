class BooksController < ApplicationController
  def top
  end

  def index
  	@book = Book.new
  	@books = Book.all
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new

  end

  def create
  	@book = Book.new(book_params)


  	@books = Book.all

  	if @book.save
  		flash[:notice] = "Book was successfully updated."
  		redirect_to book_path(@book.id)
  		# redirect_to("/book/#{@book.id}")
  	else
  		render action: :index
  	end

  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    # book.update(book_params)
    # redirect_to book_path(book)

    if book.update(book_params)
    	flash[:notices] = "Book was successfully updated."
    	redirect_to book_path(book.id)

    else
    	reder action: :edit
    end

  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end







































