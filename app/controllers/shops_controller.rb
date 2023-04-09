class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
      redirect_to shop_path(@shop), notice: "カフェが登録されました！"
    else
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to @shop, notice: "カフェが更新されました！"
    else
      render :edit
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def destroy
    @shop = Shop.find(params[:id])
    if @shop.destroy
      flash[:notice] = "カフェを削除しました"
      redirect_to root_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to @shop
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :description, :address, :latitude, :longitude, :phone, :opening, :closed,
    :smoking, :payment, :url, images: [])
  end
end
