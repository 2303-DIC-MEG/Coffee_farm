class Users::SessionsController < Devise::SessionsController
  def guest_admin_sign_in
    user = User.guest_admin
    sign_in user
    redirect_to user_path(current_user.id), notice:  'ゲスト管理者としてログインしました。'
  end

  def guest_coffee_farm_sign_in
    user = User.guest_coffee_farm
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end  
end
