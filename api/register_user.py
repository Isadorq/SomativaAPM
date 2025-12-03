from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth.models import User
from rest_framework_simplejwt.tokens import RefreshToken

class RegisterView(APIView):
    def post(self, request):
        username = request.data.get("username")
        email = request.data.get("email")
        password = request.data.get("password")

        if User.objects.filter(username=username).exists():
            return Response({"error": "Username já existe"}, status=400)

        user = User.objects.create_user(username=username, email=email, password=password)
        user.save()

        return Response({"message": "Usuário criado com sucesso!"}, status=201)
