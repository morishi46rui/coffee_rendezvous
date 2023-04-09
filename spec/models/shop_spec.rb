require 'rails_helper'

RSpec.describe Shop, type: :model do
  let(:user) { create(:user) }
  let(:shop) { create(:shop, user: user) }

  it "is valid with valid attributes" do
    expect(shop).to be_valid
  end

  it "is not valid without a name" do
    shop.name = nil
    expect(shop).to_not be_valid
  end

  it "is not valid with a name that is too long" do
    shop.name = "a" * 51
    expect(shop).to_not be_valid
  end

  it "is not valid without an address" do
    shop.address = nil
    expect(shop).to_not be_valid
  end

  it "belongs to a user" do
    expect(shop.user).to eq(user)
  end

  it "can have multiple images" do
    image1 = fixture_file_upload("spec/fixtures/images/shop1.png", "image/png")
    image2 = fixture_file_upload("spec/fixtures/images/shop2.png", "image/png")
    shop.images.attach(image1, image2)
    expect(shop.images.count).to eq(2)
  end
end
