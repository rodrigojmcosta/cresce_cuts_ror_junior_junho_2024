FactoryBot.define do
  factory :order do
    association :customer
    association :store
    association :cart

    status { :pending }

    before(:create) do |order|
      order.total = order.cart.cart_items.sum { |cart_item| cart_item.item.price * cart_item.quantity }
    end
  end
end