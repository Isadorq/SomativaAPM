Hot To Go

Backend em Django para Aplicativo de Delivery

📌 Sobre o Projeto

Hot To Go é um sistema backend desenvolvido em Django, criado para dar suporte a um aplicativo mobile de delivery.
O sistema inclui autenticação de usuários, exibição de cardápio, gerenciamento de carrinho, cálculo automático de frete via ViaCEP e confirmação de pedidos.

O nome do aplicativo é uma homenagem à música “Hot To Go” da artista Chappell Roan.

🛠️ Tecnologias Utilizadas

Python 3

Django

Django REST Framework

SQLite ou PostgreSQL

API ViaCEP

Git / GitHub

⚙️ Funcionalidades do Backend
1. Autenticação

Cadastro de usuários

Login com validação em banco

(Opcional) Autenticação JWT

2. Cardápio

Exibição de itens do menu

Listagem por categoria (ex.: lanches, pizzas)

3. Carrinho

Adicionar itens

Remover itens

Cálculo de subtotal

4. Cálculo de Frete

Consulta de CEP via API ViaCEP

Retorno de endereço

Cálculo automático da taxa de entrega

Pedidos acima de R$ 100,00 possuem frete gratuito

5. Confirmação do Pedido

Exibe endereço retornado pelo CEP

Mostra valores finais do pedido

📂 Estrutura do Projeto (Exemplo)
hot_to_go/
│
├── manage.py
│
├── backend/
│   ├── settings.py
│   ├── urls.py
│   └── ...
│
├── usuarios/
│   ├── models.py
│   ├── serializers.py
│   ├── views.py
│   └── urls.py
│
├── produtos/
│   ├── models.py
│   ├── serializers.py
│   ├── views.py
│   └── urls.py
│
└── pedidos/
    ├── models.py
    ├── serializers.py
    ├── views.py
    └── urls.py

▶️ Como Executar
1. Clonar o repositório
git clone https://github.com/seu-usuario/hot-to-go.git
cd hot-to-go

2. Criar e ativar ambiente virtual
python -m venv venv
source venv/bin/activate   # Linux/Mac
venv\Scripts\activate      # Windows

3. Instalar dependências
pip install -r requirements.txt

4. Aplicar migrações
python manage.py migrate

5. Criar superusuário (opcional)
python manage.py createsuperuser

6. Executar o servidor
python manage.py runserver

📄 Observações

Este projeto foi desenvolvido como parte da somativa da disciplina de Aplicação Mobile, referente ao último semestre da faculdade.
