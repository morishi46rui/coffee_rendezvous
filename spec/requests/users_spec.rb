require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  describe "GET /show" do
    before { sign_in user }

    it "returns http success" do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end
  end
end
