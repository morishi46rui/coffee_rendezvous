require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let!(:user) { create(:user) }

    it "is valid with the correct attributes" do
      expect(user).to be_valid
    end

    it "is invalid without an email" do
      user.email = nil
      expect(user).not_to be_valid
    end

    it "is invalid without a name" do
      user.name = nil
      expect(user).not_to be_valid
    end

    it "is invalid with a short password" do
      user.password = '12345'
      expect(user).not_to be_valid
    end
  end
end
