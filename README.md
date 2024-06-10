# Desafio Prático em Ruby on Rails

## Objetivo
O objetivo deste desafio é avaliar suas habilidades em Ruby on Rails para desenvolver uma aplicação backend que gerencie o fluxo de pedidos em um sistema de e-commerce. Você deve implementar modelos, associações, validações e o fluxo de alteração de status dos pedidos, focando na manipulação de dados via console do Rails.

## Requisitos Funcionais
1. **Modelos:**
   - **Loja:** Deve ter um nome, descrição e endereço.
   - **Cliente:** Deve ter um nome, e-mail (com validação de unicidade) e endereço.
   - **Pedido:** Deve ter uma data de criação, total do pedido e status (pendente, em separação, confirmado, em rota, disponível para retirada).
   - **Item:** Deve ter um nome, descrição, preço e quantidade em estoque.
   - **Carrinho:** Deve pertencer a um cliente e conter múltiplos itens.

2. **Associações:**
   - Um pedido pertence a um cliente e a uma loja.
   - Um pedido tem muitos itens.
   - Um carrinho pertence a um cliente.
   - Um carrinho tem muitos itens.

3. **Fluxo de Status do Pedido:**
   - **Pendente:** O administrador da loja aceita o pedido, alterando o status para "em separação".
   - **Em Separação:** A separação dos itens do pedido é feita. Todos os itens devem ser marcados como separados (presentes) para o status evoluir para "confirmado".
   - **Confirmado:** O pagamento do pedido é realizado. O status do pedido é alterado para "em rota" ou "disponível para retirada".

4. **Funcionalidades:**
   - CRUD completo para Loja, Cliente, Pedido, Item e Carrinho via console do Rails.
   - Validações adequadas para todos os campos (ex.: presença, formato, etc.).
   - Testes com RSpec.

## Requisitos Não Funcionais
- Aderência às boas práticas do Ruby on Rails e padrões de código.
- Utilização de migrações para criação de tabelas e mudanças no banco de dados.
- Uso de seeds para popular o banco de dados com dados iniciais.
- Documentação básica de como rodar a aplicação (README.md).

## Submissão
1. Faça um fork do repositório do desafio (um link para o repositório deve ser fornecido).
2. Implemente a solução.
3. Envie um pull request com sua implementação.
4. Inclua um arquivo README.md com as instruções para configurar e rodar a aplicação localmente, bem como qualquer outra informação relevante.

## Orientações Adicionais
- Cada candidato deve criar sua branch sendo seu nome completo (exemplo: rafael_tomaz_parreira).
- Cada candidato deve criar seu próprio Pull Request (PR) para avaliação da implementação.
- Todas as operações de criação, leitura, atualização e exclusão devem ser realizadas via console do Rails.
- Inclua exemplos de comandos no README.md para guiar o usuário em como manipular os dados via console.
- Utilize seeds para criar dados iniciais que possam ser usados para testar a aplicação.
- A aplicação deve seguir os padrões de codificação do Ruby on Rails e ser bem organizada.

## Suporte
Se tiver dúvidas durante o desenvolvimento, por favor, entre em contato através do e-mail [rafael@crescevendas.com](mailto:rafael@crescevendas.com).
