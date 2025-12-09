Hot To Go
📌 Sobre o Projeto

Hot To Go é um sistema backend desenvolvido em Django para dar suporte a um aplicativo mobile de delivery.
O sistema inclui autenticação de usuários, exibição de cardápio, gerenciamento de carrinho, cálculo automático de frete via API ViaCEP e confirmação de pedidos.

O nome do aplicativo é uma homenagem à música “Hot To Go”, da artista Chappell Roan.

💻 Tecnologias Utilizadas

Python 3

Django

Django REST Framework

SQLite ou PostgreSQL

API ViaCEP

Git / GitHub

⚙️ Funcionalidades
🔐 Autenticação

Cadastro de usuário

Login com verificação no banco

🍽️ Cardápio

Exibição das opções de alimentos

Separação por categorias (lanches/pizzas)

🛒 Carrinho

Adicionar itens

Remover itens

Cálculo automático do subtotal

🚚 Cálculo de Frete

Consulta de CEP via API ViaCEP

Exibição do endereço retornado

Taxa calculada automaticamente

Pedidos acima de R$ 100 possuem frete grátis

✔️ Confirmação do Pedido

Mostra endereço final

Exibe valores totais da compra

📂 Estrutura do Projeto (Resumo)
hot_to_go/
│
├── backend/
│   ├── settings.py
│   └── urls.py
│
├── usuarios/
│
├── produtos/
│
└── pedidos/

▶️ Como Executar

Clonar o repositório

git clone https://github.com/seu-usuario/hot-to-go.git


Criar e ativar o ambiente virtual

python -m venv venv
venv\Scripts\activate


Instalar dependências

pip install -r requirements.txt


Rodar migrações

python manage.py migrate


Iniciar servidor

python manage.py runserver

📝 Observação

Este projeto foi desenvolvido como parte da avaliação somativa da disciplina de Aplicações Mobile, referente ao último semestre da faculdade.
