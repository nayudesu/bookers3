class BooksController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      redirect_to book_path(book)
    else 
      render :new
    end 
  end 
  
  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books.all
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book)
    else
      render :edit
    end 
  end 
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end 

  private
  
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
