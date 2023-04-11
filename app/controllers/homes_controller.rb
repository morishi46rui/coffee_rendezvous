class HomesController < ApplicationController
  def index
    @user = current_user
    @shops = Shop.all
    @new_shops = Shop.order(created_at: :desc).limit(3)
    @new_comments = Comment.order(created_at: :desc).limit(3)
    @popular_shops = Shop.joins(:bookmarks).group(:id).order('count(bookmarks.id) desc').limit(3)
    @markers = @shops.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { shop: shop }),
      }
    end
  end

  def guest
    user          = User.new(user_params)
    user.name     = "ゲストユーザー"
    user.email    = SecureRandom.alphanumeric(15) + "@email.com"
    user.password = SecureRandom.alphanumeric(10)
    user.save
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
