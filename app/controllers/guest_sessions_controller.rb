class GuestSessionsController < ApplicationController
  def create
    user = User.find_or_create_by(email: "guest@example.com") do |guest_user|
      guest_user.password = "password"
      guest_user.name = "ゲストユーザー"
    end
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
  end
end
