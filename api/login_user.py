from django.contrib.auth import authenticate
from django.http import JsonResponse
import json
import jwt

SECRET = "SEGREDO_SUPER_FODA"

def login_user(request):
    if request.method == "POST":
        data = json.loads(request.body)
        user = authenticate(username=data["username"], password=data["password"])

        if user:
            token = jwt.encode({"user": user.username}, SECRET, algorithm="HS256")
            return JsonResponse({"token": token})
        return JsonResponse({"error": "invalid credentials"}, status=400)
