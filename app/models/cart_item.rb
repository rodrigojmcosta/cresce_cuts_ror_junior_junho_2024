class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  validates :quantity, presence: true

  after_create :decrease_stock_of_item_added

  def mark_as_separated
    update(separated: true)
  end

  def decrease_stock_of_item_added
    item.update(stock_quantity: item.stock_quantity - quantity)
  end
end