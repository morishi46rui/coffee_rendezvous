require 'rails_helper'

RSpec.describe HomesController, type: :request do
  describe 'GET #index' do
    let(:user) { create(:user) }
    let!(:shops) { create_list(:shop, 5, user: create(:user)) }
    let!(:bookmarks) { create_list(:bookmark, 3, shop: shops.sample, user: create(:user)) }
    let!(:comments) { create_list(:comment, 3, shop: shops.sample, user: create(:user)) }

    context 'When logged in' do
      before do
        sign_in user
        get root_path
      end

      it 'Request succeeds' do
        expect(response).to have_http_status(200)
      end

      it 'Correct template (:index) is rendered' do
        expect(response).to render_template(:index)
      end

      it '@user is assigned to the current user' do
        expect(assigns(:user)).to eq(user)
      end
    end

    context 'When not logged in' do
      before do
        get root_path
      end

      it 'Request succeeds' do
        expect(response).to have_http_status(200)
      end

      it 'Correct template (:index) is rendered' do
        expect(response).to render_template(:index)
      end

      it '@user is nil' do
        expect(assigns(:user)).to be_nil
      end

      it "assigns @shops" do
        expect(assigns(:shops)).to match_array(shops)
      end

      it "assigns @new_shops" do
        expect(assigns(:new_shops)).to match_array(shops.last(3))
      end

      it "assigns @new_comments" do
        expect(assigns(:new_comments)).to match_array(comments.sort_by(&:created_at).reverse.first(3))
      end

      it "assigns @popular_shops" do
        expect(assigns(:popular_shops)).to match_array(bookmarks.group_by(&:shop_id).map do |id, bookmarks|
                                                         [Shop.find(id), bookmarks.count]
                                                       end .sort_by { |shop, count| -count }.first(3).map(&:first))
      end
    end
  end
end
