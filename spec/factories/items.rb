FactoryBot.define do
  factory :item do
    name { "Item Exemplo" }
    description { "Descrição do Item Exemplo" }
    price { 10.0 }
    stock_quantity { 100 }
  end
end