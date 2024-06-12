FactoryBot.define do
  factory :customer do
    name { "Cliente Teste" }
    email { "teste@example.com" }
    address { "Endereço do Cliente Teste" }
  end
end