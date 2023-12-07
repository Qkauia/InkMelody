class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  #委任 delegate
  delegate :count, to: :cart_items

  def add!(t)
    #比對cart_item的product_id跟cart的product_id是否一樣
    found_item = cart_items.find { |item| item.product == t.product }
    #如果有一樣再更新數量
    if found_item
      found_item.increment!(:quantity, t.quantity)
    else
      #要不然打商品id跟數量帶入cart_items
      cart_items << t
    end
  end
end
