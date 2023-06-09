class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
    @search = Blog.ransack(params[:q])
    @search_blogs = @search.result
  end

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, alert: '画面を閲覧する権限がありません。'
  end  
end