class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book

  def create
    @vote = @book.votes.new(user: current_user)

    respond_to do |format|
      if @vote.save
        flash.now[:notice] = "Vote casted successfully"
        format.html { redirect_to @book }
        format.turbo_stream
      else
        flash.now[:alert] = "You have already voted for this book"
        format.html { redirect_to @book }
        format.turbo_stream
      end
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
