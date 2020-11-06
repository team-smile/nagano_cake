class Genre < ApplicationRecord
  validates :name, presence: true
  validates :is_active, inclusion: [true, false]
  has_many :items, dependent: :destroy
end