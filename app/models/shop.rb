class Shop < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :shop_categories, dependent: :destroy
  has_many :categories, through: :shop_categories

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true
end
