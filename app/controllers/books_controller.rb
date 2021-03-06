class BooksController < ApplicationController

	before_action :read?, only: :read

	def index
		@books = Book.order_title
	end

	def new
		@book = Book.new
	end

	def show

		@book = Book.find(params[:id])

		@read = @book.read_by_user?(current_user)
	end

	def read
		book = Book.find(params[:id])

		book.users << current_user

		redirect_to book_path(book), notice: "You read this book...whore"
	end

	def create
		if Book.create(permit_params)
			flash[:notice] = "Book successfully made"
			redirect_to books_path
		else
			render 'new'
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(permit_params)
			flash[:notice] = "Book successfully edited"
			redirect_to books_path
		else
			render 'edit'
		end
	end

	def destroy
		@book = Book.find(params[:id])
		if @book.destroy
			flash[:notice] = "Book successfully destroyed"
			redirect_to books_path
		end
	end

	private

	def permit_params
		params.require(:book).permit!
	end

	def read?

		book = Book.find(params[:id])

		if book.read_by_user?(current_user)
			redirect_to book_path(book), notice: "You already read that book motherfucker piece of shit abuser"
		end

	end
end
