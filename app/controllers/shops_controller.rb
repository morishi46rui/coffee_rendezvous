class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).order(id: :DESC)
    @categories = Category.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
      @shop.categories << Category.where(id: params[:category_ids])
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
    :smoking, :payment, :url, images: [], category_ids: [])
  end

  def set_q
    @q = Shop.ransack(params[:q])
  end
end
