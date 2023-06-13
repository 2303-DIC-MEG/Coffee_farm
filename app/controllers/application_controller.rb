class ApplicationController < ActionController::Base
  before_action :set_search
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_search
    @search = Blog.ransack(params[:q])
    @search_blogs = @search.result
  end

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, alert: '画面を閲覧する権限がありません。'
  end  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
  end
end