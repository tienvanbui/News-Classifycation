
from . import views
from django.urls import path, include
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
urlpatterns = [
    path('',  views.index),
    path('classify',views.predictWithNavieBayesModel),
]
urlpatterns += staticfiles_urlpatterns()
