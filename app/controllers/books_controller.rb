class BooksController < ApplicationController
  # shallow instance variables
# @book = Book.find params[:id]
# @writer = @book.writer

  def index
    @writer = Writer.find params[:writer_id]
    @books = @writer.books
  end

  def new
    @writer = Writer.find params[:writer_id]
    @book = Book.new
  end

  def create
    @writer = Writer.find params[:writer_id]
    @book = Book.new book_params
    @book.writer = @writer
    if @book.save
      redirect_to writer_books_path(@writer)
    else
      render :new
    end
  end

  def show
    @book = Book.find params [:id]
    @writer = @book.writer
  end

  def update
    @book = Book.find params[:id]
    @book.update_attributes book_params
    @author = @book.author
    if @book.save
      redirect_to book_path(@book)
    else
      render :edit
    end

  end

  def edit
    @book = Book.find params [:id]
    @writer = @book.writer
  end

  def destroy
    book = Book.find params[:id]
    book.destroy
    redirect_to writer_books_path(book.writer)
  end

  private
  def book_params
    params.require(:book).permit(:title, :writer_id)
  end
end
