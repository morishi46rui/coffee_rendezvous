require 'rails_helper'

RSpec.describe "Shops", type: :request do
  let!(:user) { create(:user) }
  let!(:shop) { create(:shop, user: user) }

  describe "GET /shops" do
    it "returns http success" do
      get "/shops"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /shops/new" do
    before { sign_in user }

    it "returns http success" do
      get "/shops/new"
      expect(response).to have_http_status(:success)
    end

    context "when logged in" do
      before { sign_in user }

      it "returns http success" do
        get "/shops/new"
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET /edit" do
    before { sign_in user }

    it "returns http success" do
      get "/shops/#{shop.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /shops" do
    let(:valid_params) do
      {
        shop: {
          name: "Test Shop",
          address: "Test Address",
          phone: "Test Phone",
        },
      }
    end

    context "when not logged in" do
      it "redirects to the login page" do
        post "/shops", params: valid_params
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when logged in" do
      before { sign_in user }

      context "with valid params" do
        it "creates a new shop" do
          expect do
            post "/shops", params: valid_params
          end.to change(Shop, :count).by(1)
        end

        it "redirects to the created shop" do
          post "/shops", params: valid_params
          expect(response).to redirect_to(Shop.last)
        end
      end

      context "with invalid params" do
        let(:invalid_params) do
          {
            shop: {
              name: "",
              address: "Test Address",
              phone: "Test Phone",
            },
          }
        end

        it "does not create a new shop" do
          expect do
            post "/shops", params: invalid_params
          end.not_to change(Shop, :count)
        end

        it "renders the new template" do
          post "/shops", params: invalid_params
          expect(response).to render_template(:new)
        end
      end
    end
  end

  describe "GET /shops/:id" do
    context "when not logged in" do
      it "redirects to the login page" do
        get "/shops/#{shop.id}/edit"
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when logged in as the shop owner" do
      before { sign_in user }

      it "returns http success" do
        get "/shops/#{shop.id}/edit"
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "DELETE /shops/:id" do
    context "when the user is not logged in" do
      it "redirects to the login page" do
        delete shop_path(shop)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when the user is logged in" do
      before { sign_in user }

      context "when the shop belongs to the user" do
        it "deletes the shop" do
          expect do
            delete shop_path(shop)
          end.to change(Shop, :count).by(-1)
        end

        it "redirects to the root page" do
          delete shop_path(shop)
          expect(response).to redirect_to(root_path)
        end

        it "sets a flash message" do
          delete shop_path(shop)
          expect(flash[:notice]).to eq("カフェを削除しました")
        end
      end
    end
  end
end
