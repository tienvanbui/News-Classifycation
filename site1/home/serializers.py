from dataclasses import field
from rest_framework import serializers

from .models import News

class GetAllNewsSerializer(serializers.ModelSerializer):

    class Meta:
        model = News
        fields = '__all__'
        field = {'id', 'title','content','link','category'}