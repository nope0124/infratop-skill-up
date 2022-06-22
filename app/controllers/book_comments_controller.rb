class BookCommentsController < ApplicationController
  def create
    book_comment_new = BookComment.new(book_comment_params)
    book = Book.find(params[:book_id])
    book_comment_new.book_id = book.id
    book_comment_new.user_id = current_user.id
    book_comment_new.save
    redirect_to book_path(book.id)
  end

  def destroy
    book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    book_comment.destroy
    redirect_to book_path(params[:book_id])
  end

  private
    def book_comment_params
      params.require(:book_comment).permit(:comment)
    end
end
