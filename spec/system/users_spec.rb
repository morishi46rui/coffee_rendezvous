require "rails_helper"

RSpec.describe "User profile page", type: :system do
  include LoginHelper
  let(:user) { create(:user, name: "John Doe", profile: "Hello, I'm John!") }

  before do
    sign_in user
    visit user_path(user)
  end

  it "displays user information" do
    expect(page).to have_content("John Doe")
    expect(page).to have_content("Hello, I'm John!")
    expect(page).to have_css("img.avatar-image")
  end

  context "when the user is the current user" do
    it "has an edit link" do
      expect(page).to have_link("ユーザ情報を編集", href: edit_user_registration_path)
    end
  end

  context "when the user is not the current user" do
    let(:other_user) { create(:user) }

    before do
      visit user_path(other_user)
    end

    it "does not have an edit link" do
      expect(page).not_to have_link("ユーザ情報を編集", href: edit_user_registration_path)
    end
  end
end
