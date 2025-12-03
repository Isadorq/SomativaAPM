from django.contrib.auth.models import User
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.generics import ListAPIView
from rest_framework.serializers import ModelSerializer
from rest_framework_simplejwt.views import TokenObtainPairView

class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ["id", "username", "email"]

class UserListView(ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [IsAuthenticated]

class LoginView(TokenObtainPairView):
    """Usa JWT padrão do SimpleJWT para login."""
    pass

class RegisterView(APIView):
    def post(self, request):
        username = request.data.get("username")
        email = request.data.get("email")
        password = request.data.get("password")

        if User.objects.filter(username=username).exists():
            return Response(
                {"error": "Username já existe"},
                status=status.HTTP_400_BAD_REQUEST
            )

        User.objects.create_user(
            username=username,
            email=email,
            password=password,
        )

        return Response(
            {"message": "Usuário criado com sucesso!"},
            status=status.HTTP_201_CREATED
        )
