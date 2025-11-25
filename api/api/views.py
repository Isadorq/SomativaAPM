# api/views.py

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from .serializers import UserSerializer

class RegisterView(APIView):
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(
                {"message": "Usuário criado com sucesso."}, 
                status=status.HTTP_201_CREATED
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class LoginView(APIView):
    def post(self, request):
        email = request.data.get('email')
        password = request.data.get('password')

        try:
            user = User.objects.get(email__iexact=email)
            username = user.username
        except User.DoesNotExist:
            return Response(
                {'error': 'Credenciais inválidas.'}, 
                status=status.HTTP_400_BAD_REQUEST
            )
        
        user_auth = authenticate(request, username=username, password=password)

        if user_auth is not None:
            return Response(
                {'message': 'Login bem-sucedido'}, 
                status=status.HTTP_200_OK
            )
        else:
            return Response(
                {'error': 'Credenciais inválidas.'}, 
                status=status.HTTP_400_BAD_REQUEST
            )