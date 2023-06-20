class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def new
    user = User.new
    user.build_profile
  end

  def show
    @user = User.find(params[:id])
    @blog = @user.blogs

    favorites = Favorite.where(user_id: current_user.id).pluck(:blog_id)  # ログイン中のユーザーのお気に入りのblog_idカラムを取得
    @favorite_list = Blog.find(favorites)     # blogsテーブルから、お気に入り登録済みのレコードを取得
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password) 
  end

  def set_user
    @user = User.find(params[:id])
  end

end
