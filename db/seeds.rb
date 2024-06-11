# As linhas de código abaixo são interpretadas ao executar `db:seed`, e alimentam o banco de dados com alguns registros
# Lojas
store1 = Store.create(name: "Store A", description: "Description of Store A", address: "Address of Store A")
store2 = Store.create(name: "Store B", description: "Description of Store B", address: "Address of Store B")

# Clientes
customer1 = Customer.create(name: "Customer 1", email: "customer1@example.com", address: "Address of Customer 1")
customer2 = Customer.create(name: "Customer 2", email: "customer2@example.com", address: "Address of Customer 2")

# Itens
item1 = Item.create(name: "Item 1", description: "Description of Item 1", price: 10.0, stock_quantity: 100)
item2 = Item.create(name: "Item 2", description: "Description of Item 2", price: 20.0, stock_quantity: 200)

# Pedidos
order1 = Order.create(creation_date: DateTime.now, total: 30.0, status: "pending", customer: customer1, store: store1)
order2 = Order.create(creation_date: DateTime.now, total: 40.0, status: "in progress", customer: customer2, store: store2)

# Itens de um pedido
OrderItem.create(order: order1, item: item1, quantity: 2)
OrderItem.create(order: order1, item: item2, quantity: 1)
OrderItem.create(order: order2, item: item1, quantity: 4)

# Carrinhos
cart1 = Cart.create(customer: customer1)
cart2 = Cart.create(customer: customer2)

# Itens do carrinho
CartItem.create(cart: cart1, item: item1, quantity: 2)
CartItem.create(cart: cart1, item: item2, quantity: 1)
CartItem.create(cart: cart2, item: item1, quantity: 4)