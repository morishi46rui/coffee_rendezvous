require 'rails_helper'

RSpec.describe BookmarksController, type: :request do
  let(:user) { create(:user) }
  let(:shop) { create(:shop, user: user) }
  let!(:bookmark) { create(:bookmark, user: user, shop: shop) }

  describe "POST /shops/:shop_id/bookmarks" do
    context "when user is authenticated" do
      before { sign_in user }

      it "creates a new bookmark for the shop" do
        expect do
          post shop_bookmarks_path(shop)
        end.to change { shop.bookmarks.count }.by(1)
        expect(response).to redirect_to(root_path)
      end
    end

    context "when user is not authenticated" do
      it "does not create a new bookmark and redirects to login page" do
        expect do
          post shop_bookmarks_path(shop)
        end.not_to change { shop.bookmarks.count }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "DELETE /shops/:shop_id/bookmarks/:id" do
    context "when user is authenticated" do
      before { sign_in user }

      it "destroys the bookmark for the shop" do
        expect do
          delete shop_bookmark_path(shop, bookmark)
        end.to change { shop.bookmarks.count }.by(-1)
        expect(response).to redirect_to(root_path)
      end
    end

    context "when user is not authenticated" do
      it "does not destroy the bookmark and redirects to login page" do
        expect do
          delete shop_bookmark_path(shop, bookmark)
        end.not_to change { shop.bookmarks.count }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
