class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telphone_number, :email, presence: true
  validates :is_deleted, inclusion: [true, false]
  validates :telphone_number, :postal_code, numericality: {only_integer: true}
  
  def self.search_for(content)
    Customer.where("name LIKE ?", "%" + content + "%")
  end
end
