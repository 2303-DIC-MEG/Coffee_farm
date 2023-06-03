class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
    @search = Blog.ransack(params[:q])
    @search_blogs = @search.result
  end
end