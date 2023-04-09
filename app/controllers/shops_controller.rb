class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
      redirect_to shop_path(@shop), notice: "Shop successfully created!"
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
      redirect_to @shop
    else
      render :edit
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def destroy
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :description, :address, :latitude, :longitude, :phone, :opening, :closed,
    :smoking, :payment, :url, images: [])
  end
end
