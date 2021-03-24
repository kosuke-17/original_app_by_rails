class UsersController < ApplicationController
  

  def index
    @users = User.all
  end

  def edit
  end
  
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @words = @user.words
  end

  def search
    @users = User.search(params[:keyword])
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :name, :name_kana, :profile, :job_id, :user_image)
  end
end
