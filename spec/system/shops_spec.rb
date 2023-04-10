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
end
