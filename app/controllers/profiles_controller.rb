class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]

  def index
    @profiles = Profile.all
  end

  def show
    @user = User.find(@profile.user_id)
    @blogs = @user.blogs

    # QRコードの生成
    qr_code = RQRCode::QRCode.new(profile_url(@profile))
    @qr_code_svg = qr_code.as_svg(module_size: 3)
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = current_user.build_profile(profile_params)
  
    if @profile.save
      redirect_to @profile, notice: "プロフィールを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: "プロフィールを変更しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: "Profile was successfully destroyed."
  end
  

  private

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:name, :description, :country, :address, :image, :image_cache)
    end
end
