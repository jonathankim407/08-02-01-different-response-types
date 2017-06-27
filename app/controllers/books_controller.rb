class BooksController < ApplicationController

  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.text
      format.csv
      # format.json { render json: @books }
      format.json do
        render json: @books.map { |book|
          {
            book_title: book.title,
            book_id: book.id,
            book_author: book.author,
            book_already_read: book.already_read
          }
        }
      end
    end
  end

end
