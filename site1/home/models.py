from django.db import models

# Create your models here.
class News(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.TextField()
    content = models.TextField()
    link = models.TextField()
    category = models.TextField()
    img = models.TextField()
