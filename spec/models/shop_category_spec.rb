require 'rails_helper'

RSpec.describe ShopCategory, type: :model do
  describe 'validations' do
    let(:user) { create(:user) }
    let(:shop) { create(:shop, user: user) }
    let(:category) { create(:category) }
    let!(:shop_category) { create(:shop_category, shop: shop, category: category) }

    it 'is valid with valid attributes' do
      expect(shop_category).to be_valid
    end

    it 'is invalid without a shop_id' do
      shop_category.shop_id = nil
      expect(shop_category).not_to be_valid
    end

    it 'is invalid without a category_id' do
      shop_category.category_id = nil
      expect(shop_category).not_to be_valid
    end
  end

  describe 'associations' do
    it 'is associated with Shop' do
      association = described_class.reflect_on_association(:shop)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'is associated with category' do
      association = described_class.reflect_on_association(:category)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
