class User < ApplicationRecord
  has_one_attached :avatar
  has_many :shops

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
