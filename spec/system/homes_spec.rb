require 'rails_helper'

RSpec.describe "Homes", type: :system do
  let!(:user) { create(:user) }
  let!(:shop) { create(:shop, user: user) }

  before do
    visit root_path
  end

  describe "home page section" do
    it "displays the welcome message" do
      expect(page).to have_content("Welcome to Coffee Rendezvous")
    end
  end

  describe "new shops section" do
    context "displays a list of new shops with their image, name, and address" do
      it "displays a title" do
        expect(page).to have_content("新着カフェ")
      end

      it "image" do
        within ".new-shops" do
          expect(page).to have_css(".card-img-top")
        end
      end

      it "name" do
        within ".new-shops" do
          expect(page).to have_css(".card-title")
        end
      end

      it "address" do
        within ".new-shops" do
          expect(page).to have_css(".card-text")
        end
      end
    end
  end

  describe "new comments section" do
    let!(:comment1) { create(:comment, shop: shop, user: user, created_at: 1.day.ago) }
    let!(:comment2) { create(:comment, shop: shop, user: user, created_at: Time.current) }

    before do
      visit root_path
    end

    it "displays the section title" do
      expect(page).to have_content("新着コメント")
    end

    it "displays each comment with its content, shop name, and creation date" do
      expect(page).to have_content(comment1.content)
      expect(page).to have_content(comment1.shop.name)
      expect(page).to have_content(comment1.created_at.strftime('%Y-%m-%d %H:%M:%S'))
      expect(page).to have_content(comment2.content)
      expect(page).to have_content(comment2.shop.name)
      expect(page).to have_content(comment2.created_at.strftime('%Y-%m-%d %H:%M:%S'))
    end

    it "links each comment's shop name to its shop page" do
      expect(page).to have_link(comment1.shop.name, href: shop_path(comment1.shop))
      expect(page).to have_link(comment2.shop.name, href: shop_path(comment2.shop))
    end
  end

  describe "popular shops section" do
    let!(:bookmark) { create(:bookmark, user: user, shop: shop) }

    before do
      visit root_path
    end
    context "displays each popular shops" do
      it "displays the section title" do
        expect(page).to have_content("人気のカフェ")
      end

      it "displays each popular shops" do
        expect(page).to have_css '.popular-shops .card'
      end
    end
  end

  describe "shops map section" do
    before do
      visit root_path
    end

    it "displays a map and button for current location" do
      expect(page).to have_css('#map')
      expect(page).to have_button('現在地に移動')
    end
  end
end
