class Shop < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true

end
