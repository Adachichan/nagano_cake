class DeliveryAddress < ApplicationRecord

  belongs_to :customer

  def delivery_address_display
    '〒' + postal_code + ' ' + address + '　' + name
  end

end
