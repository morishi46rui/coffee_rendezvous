require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let!(:user) { create(:user) }
  let!(:shop) { create(:shop, user: user) }
  let!(:bookmark) { create(:bookmark, user: user, shop: shop) }

  describe 'associations' do
    it "belongs to a user" do
      expect(bookmark.user).to eq user
    end

    it "belongs to a shop" do
      expect(bookmark.shop).to eq shop
    end
  end
end
