require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "associations" do
    it 'is associated with ShopCategory' do
      association = described_class.reflect_on_association(:shop_categories)
      expect(association.macro).to eq(:has_many)
    end

    it 'is associated with Shop' do
      association = described_class.reflect_on_association(:shops)
      expect(association.macro).to eq(:has_many)
    end
  end
end
