require 'rails_helper'

RSpec.describe HomesController, type: :request do
  describe 'GET #index' do
    let(:user) { create(:user) }

    context 'ログインしている場合' do
      before do
        sign_in user
        get root_path
      end

      it 'リクエストが成功すること' do
        expect(response).to have_http_status(200)
      end

      it '正しいテンプレート(:index)がレンダリングされること' do
        expect(response).to render_template(:index)
      end

      it '@userに現在のユーザーが割り当てられていること' do
        expect(assigns(:user)).to eq(user)
      end
    end

    context 'ログインしていない場合' do
      before do
        get root_path
      end

      it 'リクエストが成功すること' do
        expect(response).to have_http_status(200)
      end

      it '正しいテンプレート(:index)がレンダリングされること' do
        expect(response).to render_template(:index)
      end

      it 'ログインユーザがnilであること' do
        expect(assigns(:user)).to be_nil
      end
    end
  end
end
