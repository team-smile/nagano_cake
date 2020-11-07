class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  
  enum payment_method: {"クレジットカード": 0, "銀行振込":1} , _prefix: true
  enum status: %i[入金待ち 入金確認 制作中 発送準備中 発送済み ] , _prefix: true
end
