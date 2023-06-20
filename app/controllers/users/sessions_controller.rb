class Users::SessionsController < Devise::SessionsController
  def guest_admin_sign_in
    user = User.guest_admin
    Profile.guest_admin_profile
    sign_in user
    redirect_to root_path, notice:  'ゲスト管理者としてログインしました。'
  end

  def guest_coffee_farm_sign_in
    user = User.guest_coffee_farm
    Profile.guest_profile
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end  
end
