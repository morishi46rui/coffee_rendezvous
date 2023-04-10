FactoryBot.define do
  factory :shop_category, class: "ShopCategory" do
    shop_id { create(:shop).id }
    category_id { create(:category).id }
  end
end
