# Criando lojas
store1 = Store.create!(name: "Loja A", description: "Descrição da Loja A", address: "Endereço da Loja A")
store2 = Store.create!(name: "Loja B", description: "Descrição da Loja B", address: "Endereço da Loja B")

# Criando clientes
customer1 = Customer.create!(name: "Cliente 1", email: "cliente1@example.com", address: "Endereço do Cliente 1")
customer2 = Customer.create!(name: "Cliente 2", email: "cliente2@example.com", address: "Endereço do Cliente 2")

# Criando itens
item1 = Item.create!(name: "Item 1", description: "Descrição do Item 1", price: 10.0, stock_quantity: 100)
item2 = Item.create!(name: "Item 2", description: "Descrição do Item 2", price: 20.0, stock_quantity: 200)

# Criando carrinhos
cart1 = Cart.create!(customer: customer1)
cart2 = Cart.create!(customer: customer2)

# Adicionando itens aos carrinhos
cart_item1 = CartItem.create(cart_id: cart1.id, item_id: item1.id, quantity: 4)
cart_item2 = CartItem.create(cart_id: cart2.id, item_id: item2.id, quantity: 5)
cart_item3 = CartItem.create(cart_id: cart1.id, item_id: item2.id, quantity: 1)

# Criando pedidos
order1 = Order.create(customer_id: customer1.id, store_id: store1.id, cart_id: cart1.id)
order2 = Order.create(customer_id: customer2.id, store_id: store2.id, cart_id: cart2.id)

# Atualizando lojas
store1.update!(name: "Loja A Atualizada", description: "Descrição Atualizada da Loja A", address: "Endereço Atualizado da Loja A")
store2.update!(name: "Loja B Atualizada", description: "Descrição Atualizada da Loja B", address: "Endereço Atualizado da Loja B")

# Atualizando clientes
customer1.update!(name: "Cliente 1 Atualizado", email: "cliente1_atualizado@example.com", address: "Endereço Atualizado do Cliente 1")
customer2.update!(name: "Cliente 2 Atualizado", email: "cliente2_atualizado@example.com", address: "Endereço Atualizado do Cliente 2")

# Atualizando itens
item1.update!(name: "Item 1 Atualizado", description: "Descrição Atualizada do Item 1", price: 12.0, stock_quantity: 110)
item2.update!(name: "Item 2 Atualizado", description: "Descrição Atualizada do Item 2", price: 22.0, stock_quantity: 210)

# Atualizando pedidos e status dos itens
cart_items = order1.cart.cart_items
cart_items.each do |ci|
  ci.mark_as_separated
end
order1.complete_separation
order1.complete_payment_and_dispatch

order2.accept_order
cart_items = order2.cart.cart_items
cart_items.each do |ci|
  ci.mark_as_separated
end
order2.complete_separation
order2.complete_payment_and_ready_for_pickup

# Deletando pedidos primeiro
order2.destroy!

# Deletar itens do carrinho
cart_item2.destroy!

# Deletar carrinhos
cart2.destroy!

# Deletar itens
item2.destroy!

# Deletar clientes
customer2.destroy!

# Deletar lojas
store2.destroy!