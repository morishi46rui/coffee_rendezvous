class Category < ApplicationRecord
  has_many :shop_categories
  has_many :shops, through: :shop_categories
end
