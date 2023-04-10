class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @shop = Shop.find(params[:shop_id])
    bookmark = @shop.bookmarks.new(user_id: current_user.id)
    if bookmark.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    bookmark = @shop.bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
      bookmark.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
