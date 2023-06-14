class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
    favorites = Favorite.where(user_id: current_user.id).pluck(:blog_id)  # ログイン中のユーザーのお気に入りのblog_idカラムを取得
    @favorite_list = Blog.find(favorites)     # blogsテーブルから、お気に入り登録済みのレコードを取得
  end

  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_path, notice: "#{favorite.blog.user.profile.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to blogs_path, notice: "#{favorite.blog.user.profile.name}さんのブログをお気に入り解除しました"
  end
end
