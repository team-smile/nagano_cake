class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  
  enum making_status: %i[制作不可 制作待ち 制作中 制作完了 ] , _prefix: true
  
  

end
