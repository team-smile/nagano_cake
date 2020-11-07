class Item < ApplicationRecord
  validates :genre_id, :name, :image, :introduction, :price, presence: true
  validates :is_active, inclusion: [true, false]
  validates :price, numericality: {only_integer: true}
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  attachment :image
end