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
CartItem.create!(cart: cart1, item: item1, quantity: 2)
CartItem.create!(cart: cart1, item: item2, quantity: 1)
CartItem.create!(cart: cart2, item: item1, quantity: 4)

# Criando pedidos associados aos carrinhos
order1 = Order.create!(total: cart.cart_items.sum { |ci| ci.item.price * ci.quantity }, customer: customer1, store: store1, cart: cart1)
order2 = Order.create!(total: cart.cart_items.sum { |ci| ci.item.price * ci.quantity }, customer: customer2, store: store2, cart: cart2)

# Calculando o total dos pedidos com base nos itens dos carrinhos
order1.update!(total: order1.calculate_total)
order2.update!(total: order2.calculate_total)

# Adicionando itens aos pedidos e definindo o status de separados
OrderItem.create!(order: order1, item: item1, quantity: 2, separated: false)
OrderItem.create!(order: order1, item: item2, quantity: 1, separated: false)
OrderItem.create!(order: order2, item: item1, quantity: 4, separated: false)

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
order1.accept_order
order1.complete_separation
order1.complete_payment_and_dispatch

order2.accept_order
order2.complete_separation
order2.complete_payment_and_ready_for_pickup

# Atualizando carrinhos
cart1.update!(customer: customer2)
cart2.update!(customer: customer1)

# Atualizando itens do carrinho
cart_item1 = CartItem.find_by(cart: cart1, item: item1)
cart_item2 = CartItem.find_by(cart: cart1, item: item2)
cart_item3 = CartItem.find_by(cart: cart2, item: item1)

cart_item1.update!(quantity: 3)
cart_item2.update!(quantity: 2)
cart_item3.update!(quantity: 5)

# Deletar itens do carrinho
cart_item2.destroy!

# Deletar carrinhos
cart2.destroy!

# Deletar pedidos
order2.destroy!

# Deletar itens
item2.destroy!

# Deletar clientes
customer2.destroy!

# Deletar lojas
store2.destroy!