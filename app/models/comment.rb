class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :content, presence: true, length: { maximum: 255 }
end
