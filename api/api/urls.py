# Arquivo: somativa_apm/api/api/urls.py (Único Arquivo de URLs)

from django.contrib import admin
from django.urls import path
# 🎯 IMPORTANTE: Não use 'include' aqui!
# Importamos as Views diretamente do seu app 'api' (a pasta views.py)
from api.views import RegisterView, LoginView 

urlpatterns = [
    # Rota para o painel de administração
    path('admin/', admin.site.urls),
    
    # 🎯 ROTAS PARA O FLUTTER:
    path('api/register/', RegisterView.as_view(), name='register'),
    path('api/login/', LoginView.as_view(), name='login'),
]