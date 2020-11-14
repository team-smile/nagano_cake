class Address < ApplicationRecord
 belongs_to :customer
 validates :postal_code, :address, :name, presence: true

 def ordered_address
  ( "〒" + self.postal_code + ' ' + self.address + ' ' + self.name )
 end

end
