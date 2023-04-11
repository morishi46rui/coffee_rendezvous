require "rails_helper"

RSpec.describe "Layouts", type: :system do
  include LoginHelper
  let!(:user) { create(:user) }

  before do
    visit root_path
  end

  describe "navigation bar" do
    it "displays the Coffee Rendezvous brand link" do
      expect(page).to have_link("Coffee Rendezvous", href: root_path, class: "navbar-brand")
    end

    it "displays the Home link" do
      expect(page).to have_link("Home", href: root_path, class: "nav-link active")
    end

    it "displays the Search link" do
      expect(page).to have_link("Search", href: shops_path, class: "nav-link")
    end
    
    context "when the user is signed in" do
    
      before do
        sign_in user
      end
    
      it "displays the user's name in the dropdown menu" do
        expect(page).to have_css(".dropdown-toggle", text: user.name)
      end
    
      it "displays the user's profile link in the dropdown menu" do
        expect(page).to have_link("マイページ", href: user_path(user.id), class: "dropdown-item")
      end
    
      it "displays the logout link in the dropdown menu" do
        expect(page).to have_link("ログアウト", href: destroy_user_session_path, class: "dropdown-item")
      end
    end
    
    context "when the user is not signed in" do
      it "displays Guest in the dropdown menu" do
        expect(page).to have_css(".dropdown-toggle", text: "Guest")
      end
    
      it "displays the login link in the dropdown menu" do
        expect(page).to have_link("ログイン", href: new_user_session_path, class: "dropdown-item")
      end
    
      it "displays the sign up link in the dropdown menu" do
        expect(page).to have_link("新規登録", href: new_user_registration_path, class: "dropdown-item")
      end
    
      it "displays the guest sign in link in the dropdown menu" do
        expect(page).to have_link("ゲストログイン", href: "/guest_sign_in", class: "dropdown-item")
      end
    end
    
    it "displays the Instagram icon with the correct link" do
      within "nav" do
        expect(page).to have_link(href: "https://www.instagram.com/coffee_rendez_vous/")
      end
    end
  end
end
