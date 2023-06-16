class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @blogs = Blog.all.order(created_at: :desc)
    @blogs = @blogs.where(user_id: User.send(params[:role]).pluck(:id)) if params[:role].in?(User.roles.keys)
    # if params[:role] == "Coffee_form"
    #   @blogs = @blogs.where(user_id: User.where(role: :Coffee_farm).pluck(:id))
    # elsif params[:role] == "Barista"
    #   @blogs = @blogs.where(user_id: User.where(role: :Barista).pluck(:id))
    # end
  end

  def show
    @blog = Blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @use.id)
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
    if @blog.user == current_user
      render "edit"
    else
      redirect_to blogs_path
    end
  end

  def create
    @blog = current_user.blogs.build(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @keyword = params[:blog][:search] if params[:blog]
    @blogs = Blog.search(@keyword)
    # @blogs = Kaminari.paginate_array(@blogs_all).page(params[:page]).per(10)
  end

  private

    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content, :search, :image, :image_cache)
    end
end
