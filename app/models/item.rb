class Item < ApplicationRecord
  has_one_attached :item_image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy

  def get_item_image(size)

    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize: size).processed
  end
  
  def with_tax_price
    (price * 1.1).floor
  end

end
