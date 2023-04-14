require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:shop) { create(:shop, user: user) }
  let(:comment) { create(:comment, user_id: user.id, shop_id: shop.id) }

  it "has a valid factory" do
    expect(comment).to be_valid
  end

  it "is invalid without content" do
    comment.content = nil
    expect(comment).not_to be_valid
  end

  it "is invalid with content longer than 255 characters" do
    comment.content = "a" * 256
    expect(comment).not_to be_valid
  end

  it "belongs to a user" do
    expect(comment.user).to eq user
  end

  it "belongs to a shop" do
    expect(comment.shop).to eq shop
  end
end
