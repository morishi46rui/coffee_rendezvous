class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @shop = Shop.find(params[:shop_id])
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.shop_id = @shop.id
    if @comment.save
      redirect_to shop_path(@shop)
      flash[:notice] = "コメントを投稿しました"
    else
      redirect_to shop_path(@shop)
      flash[:notice] = "コメントの投稿に失敗しました"
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @comment = Comment.find(params[:id])
    if current_user && current_user.id == @comment.user_id
      @comment.destroy
      flash[:notice] = "コメントを削除しました"
    else
      flash[:notice] = "コメントの削除に失敗しました"
    end
    redirect_to @shop
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
