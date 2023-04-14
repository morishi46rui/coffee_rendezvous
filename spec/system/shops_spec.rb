require 'rails_helper'

RSpec.describe 'shops/index', type: :system do
  include LoginHelper
  let!(:user) { create(:user) }
  let!(:shop) { create(:shop, user: user) }
  let!(:category) { create(:category) }

  before do
    visit shops_path
  end

  it 'displays the search form' do
    expect(page).to have_selector('.search-forms')
  end

  it 'displays the list of cafes' do
    expect(page).to have_selector('.card', count: Shop.count)
  end

  it 'allows users to search for cafes by name or address' do
    fill_in '住所や店名で検索', with: '東京'
    find('.keyword-search button[type="submit"]').click
    expect(page).to have_selector('.card', count: Shop.where('name LIKE ? OR address LIKE ?', '%東京%', '%東京%').count)
  end

  it 'allows users to search for cafes by category' do
    first_category = Category.first
    check "q[categories_id_in][]", option: first_category.id
    find('.category-search button[type="submit"]').click
    expect(page).to have_selector('.card', count: Shop.joins(:categories).where(categories: { id: first_category.id }).count)
  end

  it 'displays a map', js: true do
    visit shop_path(shop)
    expect(page).to have_content "マップ"
  end

  describe "bookmark section" do
    context "when the user has not bookmarked the shop" do
      before do
        sign_in user
        visit shop_path(shop)
      end

      it "shows a bookmark button" do
        expect(page).to have_button("ブックマーク")
      end

      it "allows the user to bookmark the shop" do
        expect do
          click_button "ブックマーク"
          expect(page).to have_button("ブックマークを外す")
        end.to change { user.bookmarks.count }.by(1)
      end
    end

    context "when the user has already bookmarked the shop" do
      let!(:bookmark) { create(:bookmark, user: user, shop: shop) }

      before do
        sign_in user
        visit shop_path(shop)
      end

      it "shows a bookmark removal button" do
        expect(page).to have_button("ブックマークを外す")
      end

      it "allows the user to remove the bookmark" do
        expect do
          click_button "ブックマークを外す"
          expect(page).to have_button("ブックマーク")
        end.to change { user.bookmarks.count }.by(-1)
      end
    end
  end
end
