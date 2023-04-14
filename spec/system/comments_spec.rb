require 'rails_helper'

RSpec.describe "Comments", type: :system do
  let(:user) { create(:user) }
  let(:shop) { create(:shop, user: user) }
  let(:comment) { create(:comment, shop: shop, user: user) }

  before do
    visit shop_path(shop)
  end

  it "displays the comment area" do
    expect(page).to have_selector ".comment-area", count: shop.comments.count
  end

  it "displays the comment form" do
    expect(page).to have_content "コメントを投稿する"
    expect(page).to have_selector "form"
  end

  it "displays the comment submit button" do
    expect(page).to have_button "送信"
  end
end
