class Genre < ApplicationRecord
  validates :name, presence: true
  validates :is_active, inclusion: [true, false]
  has_many :items, dependent: :destroy
  
  def self.search_for(content)
    Genre.where("name LIKE ?", "%" + content + "%")
  end
end