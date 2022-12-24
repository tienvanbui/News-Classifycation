
from . import views
from django.urls import path, include
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from home.views import GetAllNewsAPIView
from rest_framework.urlpatterns import format_suffix_patterns
urlpatterns = [
    
    path('',  views.index1),
    path('home',  views.index_home),
    path('loginpass',  views.loginpass),
    path('phanloai',  views.index),
    path('dangnhap',  views.dangnhap),
    path('dangky',  views.dangky),
    path('classify',views.predictWithNavieBayesModel),
    path('news/',GetAllNewsAPIView.as_view()),
    path('api/news/<pk>', views.news_list_category),
    
]
urlpatterns += staticfiles_urlpatterns()
# urlpatterns = format_suffix_patterns(urlpatterns)
