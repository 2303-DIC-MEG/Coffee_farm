class FavoritesController < ApplicationController
  resources :favorites, only: [:create, :destroy]

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
end
