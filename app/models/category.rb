class Category < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end

  has_many :shop_categories
  has_many :shops, through: :shop_categories
end
