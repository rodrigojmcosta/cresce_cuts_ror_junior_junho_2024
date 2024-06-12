class AddSeparatedToCartItems < ActiveRecord::Migration[7.2]
  def change
    add_column :cart_items, :separated, :boolean
  end
end
