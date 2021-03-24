class WordsController < ApplicationController
  before_action :set_word, only: [:destroy, :update, :edit, :show]

  def index
    @words = Word.includes(:user).order("created_at DESC")

  end

  def new
    @word = Word.new
  end
  
  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @word.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @word.update(word_params)
      redirect_to word_path(@word.id)
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @word.comments.includes(:user)
  end
  
  def search
    @words = Word.search(params[:keyword])
  end

  private

  def word_params
    params.require(:word).permit(:title,:image,:note,:genre_id).merge(user_id: current_user.id)
  end
end

  def set_word
    @word = Word.find(params[:id])
  end