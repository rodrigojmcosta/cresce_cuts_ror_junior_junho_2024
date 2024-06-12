# Cresce Cuts ROR

## SETUP DO PROJETO PARA EXECUÇÃO LOCAL

### REQUISITOS
- Ruby 3.x
- Rails 6.x
- MySQL

### CONFIGURAÇÃO DO BANCO DE DADOS
1. MySQL instalado e configurado, com devidas permissões.
2. Aponte no arquivo `config/database.yml` as suas credenciais de acesso ao banco de dados e, caso desejado, configurações adicionais como a porta para conexão.

### Instalação
```bash
# Instala gems necessárias para execução do projeto (dependências).
bundle install 

# Cria o banco de dados com as configurações que apontamos no arquivo `config/database.yml`.
rails db:create 

# Executa scripts que vão criar as tabelas no banco de dados, junto de cada e atributo e associações que apontamos.
rails db:migrate 

# Executa o arquivo de seed `seeds.rb`, o qual alimentará o nosso banco de dados com alguns registros.
rails db:seed 

# Executa os testes que implementamos no diretório spec/models
bundle exec rspec

# Pode ser utilizado para limpar os dados do banco de dados.
rails db:reset 
```

## COMANDOS ÚTEIS

### Iniciar o servidor Rails
```bash
rails server
```
### Abrir o console do Rails
```bash
rails console
```

## COMANDOS ÚTEIS NO CONSOLE DO RAILS PARA TESTE DA APLICAÇÃO

### INSERIR REGISTROS
#### Criar um novo registro de loja
```bash
store = Store.create(name: "Loja Exemplo", description: "Descrição da Loja Exemplo", address: "Endereço da Loja Exemplo")
```
#### Criar um novo registro de cliente
```bash
customer = Customer.create(name: "Cliente Exemplo", email: "cliente@example.com", address: "Endereço do Cliente Exemplo")
```
#### Criar um novo registro de item
```bash
item = Item.create(name: "Item Exemplo", description: "Descrição do Item Exemplo", price: 10.0, stock_quantity: 100)
```
#### Criar um novo registro de carrinho
```bash
cart = Cart.create(customer: customer)
```
#### Adicionar um item ao carrinho
```bash
cart_item = CartItem.create(cart_id: cart.id, item_id: item.id, quantity: 4)
```
#### Criar um novo registro de pedido (status pendente (0) como padrão)
```bash
order = Order.create(customer_id: customer.id, store_id: store.id, cart_id: cart.id)
```

### CONSULTAR REGISTROS
#### Consultar uma loja a partir de um pedido
```bash
order = Order.first
store = order.store
puts store.name
```
#### Consultar todos os carrinhos de um cliente
```bash
customer = Customer.first
carts = customer.cart
carts
```
#### Consultar todos os pedidos de um cliente
```bash
customer = Customer.first
orders = customer.orders
orders.each do |order|
  puts order.id
end
```

#### Obter todos os itens de um pedido
```bash
order = Order.first
items = order.items
items.each do |item|
  puts item.name
end
```

### ATUALIZAR O STATUS DE UM PEDIDO
```bash
#Para separar os itens de um pedido, 
#é necessário iterar sobre cada cart_item e marcar como separated: true. Para isso implementei o método mark_as_separated
order = Order.first
cart_items = order.cart.cart_items
cart_items.each do |ci|
  ci.mark_as_separated
end
```

```bash
order = Order.first
order.accept_order # Altera o status para "in_progress" se estiver "pending"
order.complete_separation # Altera o status para "confirmed" se estiver "in_progress" e todos os itens estiverem separados.
order.complete_payment_and_dispatch # Altera o status para "in_route" se estiver "confirmed"
order.complete_payment_and_ready_for_pickup # Altera o status para "ready_for_pickup" se estiver "confirmed"
```

### Deletar um registro
```bash
customer = Customer.first
customer.destroy
```

### FLUXO DE STATUS DO PEDIDO
Transições de Status Permitidas:

*Pendente*: O administrador da loja aceita o pedido, alterando o status para "em separação".

*Em Separação*: A separação dos itens do pedido é feita. Todos os itens devem ser marcados como separados (presentes) para o status evoluir para "confirmado".

*Confirmado*: O pagamento do pedido é realizado. O status do pedido é alterado para "em rota" ou "disponível para retirada".

### VALIDAÇÕES ADICIONAIS/MELHORIAS IMPLEMENTADAS

#### &bull; Ao adicionar itens em um carrinho, a sua quantidade é decrescida no estoque gerando assim uma "reserva temporária", evitando que um usuário acesse a página de compra de um item não disponível, ou que durante a compra ao finalizar um pedido, o usuário pague por um item que não tenha mais estoque.
#### &bull; Ao tentar realizar um pedido, é validade se existem itens no carrinho para que não seja criado um pedido com valor igual a 0.
#### &bull; Não é preciso informar o valor total de um pedido, ao salvar um pedido o valor de todos os itens do carrinho é somado gerando assim o valor total.
#### &bull; A aplicação conta também com controllers para requisições no modelo REST via protocolo HTTP.