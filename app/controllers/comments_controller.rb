class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to "/words/#{comment.word.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, word_id: params[:word_id])
  end
end
