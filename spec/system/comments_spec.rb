require 'rails_helper'

RSpec.describe "Comments", type: :system do
  let(:user) { create(:user) }
  let(:shop) { create(:shop, user: user) }
  let(:comment) { create(:comment, shop: shop, user: user) }

  before do
    visit shop_path(shop)
  end

  it "コメントエリアが表示されていること" do
    expect(page).to have_selector ".comment-area", count: shop.comments.count
  end

  it "コメントフォームが表示されていること" do
    expect(page).to have_content "コメントを投稿する"
    expect(page).to have_selector "form"
  end

  it "コメント送信ボタンが表示されていること" do
    expect(page).to have_button "送信"
  end
end
