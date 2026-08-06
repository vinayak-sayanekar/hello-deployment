from django.http import JsonResponse
from django.shortcuts import render


def home(request):
    return render(request, "home/index.html")


def health(request):
    return JsonResponse(
        {
            "status": "healthy",
            "application": "hello-deployment",
            "message": "Application is running successfully.",
        }
    )