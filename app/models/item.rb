class Item < ApplicationRecord
  validates :genre_id, :name, :image, :introduction, presence: true
  validates :is_active, inclusion: [true, false]
  validates :price, numericality: {only_integer: true}
  validates :amount, presence: true
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre, optional: true
  attachment :image
  
  def self.search_for(content)
    Item.where("name LIKE ?", "%" + content + "%")
  end
end