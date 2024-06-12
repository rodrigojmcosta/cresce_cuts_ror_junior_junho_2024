class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  validates :name, :price, :stock_quantity, presence: true
  
  private 

  def formatted_price #Esta função é apenas para retornar o preço em um formato mais amigável para visualização caso necessário
    "$#{'%.2f' % price}".gsub('.', ',')
  end
end