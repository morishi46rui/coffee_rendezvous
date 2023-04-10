require 'rails_helper'

RSpec.describe CommentsController, type: :request do
  let!(:user) { create(:user) }
  let!(:shop) { create(:shop, user: user) }
  let!(:comment) { create(:comment, user: user, shop: shop) }

  describe "#create" do
    context "when user is logged in" do
      before { sign_in user }
      it "creates a new comment" do
        expect do
          post shop_comments_path(shop), params: { comment: { content: "Test comment" } }
        end.to change { Comment.count }.by(1)
        expect(response).to redirect_to(shop_path(shop))
        expect(flash[:notice]).to eq "コメントを投稿しました"
      end
    end

    context "when user is not logged in" do
      it "redirects to the login page" do
        post shop_comments_path(shop), params: { comment: { content: "Test comment" } }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#destroy" do
    context "when user is logged in and owns the comment" do
      before { sign_in user }
      it "destroys the comment" do
        expect do
          delete shop_comment_path(shop, comment)
        end.to change { Comment.count }.by(-1)
        expect(response).to redirect_to(shop_path(shop))
        expect(flash[:notice]).to eq "コメントを削除しました"
      end
    end

    context "when user is logged in but does not own the comment" do
      before { sign_in create(:user) }

      it "does not destroy the comment" do
        expect do
          delete shop_comment_path(shop, comment)
        end.not_to change { Comment.count }
        expect(response).to redirect_to(shop_path(shop))
        expect(flash[:notice]).to eq "コメントの削除に失敗しました"
      end
    end

    context "when user is not logged in" do
      it "redirects to the login page" do
        delete shop_comment_path(shop, comment)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
