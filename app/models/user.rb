class User < ApplicationRecord
  has_one_attached :avatar, dependent: :destroy
  has_many :shops, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
