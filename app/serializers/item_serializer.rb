class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :formatted_price, :stock_quantity, :price

  def formatted_price
    "$#{'%.2f' % object.price}".gsub('.', ',')
  end
end