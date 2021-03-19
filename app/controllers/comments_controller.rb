class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to word_path(@comment.word)
    else
      @word = @comment.word
      @comments = @word.comments
      render "words/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, word_id: params[:word_id])
  end
end
