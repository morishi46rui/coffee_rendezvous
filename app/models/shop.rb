class Shop < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["name", "address"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["categories", "images_attachments", "images_blobs", "shop_categories", "user"]
  end

  belongs_to :user, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  has_many :shop_categories, dependent: :destroy
  has_many :categories, through: :shop_categories
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true
end
