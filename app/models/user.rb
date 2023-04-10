class User < ApplicationRecord
  has_one_attached :avatar
  has_many :shops
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
