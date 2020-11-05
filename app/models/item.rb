class Item < ApplicationRecord
  validates :genre_id, :name, :image_id, :introduction, :price, :is_active, presence: true
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  attachment :image
end