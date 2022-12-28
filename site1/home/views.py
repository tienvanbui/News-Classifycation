from re import S
from unicodedata import category
from sklearn.feature_extraction.text import TfidfTransformer
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.pipeline import Pipeline
from sklearn.metrics import classification_report
from sklearn.metrics import roc_auc_score
from sklearn.metrics import accuracy_score
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from nltk.corpus import wordnet
from nltk.stem import WordNetLemmatizer
from nltk.stem import PorterStemmer  # chuyển các từ về nguyên mẫu
from nltk.corpus import stopwords  # tập từ không có ý nghĩa
from keras.preprocessing.text import text_to_word_sequence
import sklearn
import nltk
import pandas as pd  # đọc dữ liệu từ các file đầu vào và ra
import numpy as np  # linear algebra
from django.http import HttpResponse
from django.http import JsonResponse
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view
from .serializers import GetAllNewsSerializer
from .models import News
import mysql.connector
import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
# sử dụng bộ lọc kí tự đặc biệt

def downloadPackage():
    nltk.download('stopwords')
    nltk.download('punkt')
    nltk.download('averaged_perceptron_tagger')
    nltk.download('wordnet')
    nltk.download('omw-1.4')


def getTrainData():
    train_set = pd.read_csv("BBC News Train.csv")  # 1490 văn bản
    return train_set


def getSetData():
    test_set = pd.read_csv("BBC News Test.csv")  # 735 văn bản
    return test_set


def index(request):
    return render(request, 'home.html')
def index1(request):
    return render(request, 'index.html')
def index_home(request):
    return render(request, 'index.html')
def loginpass(request):
    return render(request, 'loginpass.html')
def dangnhap(request):
    return render(request, 'dangnhap.html')
def dangky(request):
    return render(request, 'dangki.html')


def predictWithNavieBayesModel(request):
    text = request.POST.get('news', '')
    train_set = getTrainData()
    test_set = getSetData()
    # downloadPackage()
    train_set['Text'] = train_set['Text'].apply(preprocessDataset)
    # tính toán bằng mô hình Multinomial navie bayes
    nb = Pipeline([('tfidf', TfidfVectorizer()), ('clf', MultinomialNB())])
    nb.fit(train_set['Text'], train_set['Category'])
    sms = nb.predict([text])
    label_sms = pd.DataFrame(list(zip(sms)), columns=['Category'])
    category = str(label_sms['Category'][0])
    return JsonResponse({'category': category}, status=200)


# Data Preprocessing tiền xử lý
def preprocessDataset(train_text):
    # word tokenization using text-to-word-sequence
    train_text = str(train_text)
    tokenized_train_set = text_to_word_sequence(train_text, filters='!"#$%&()*+,-./:;<=>?@[\\]^_`{|}~\t\n', lower=True, split=" ")
    # loại bỏ các kí tự đặc biệt
    # stop word removal
    # tập các giới từ hoặc đại từ, từ không có ý nghĩa trong phân loại (a,about,am,an,i,the,they,...)
    stop_words = set(stopwords.words('english'))
    # loại bỏ những từ thuộc tập trên
    stopwordremove = [i for i in tokenized_train_set if not i in stop_words]
    stopwordremove_text = ' '.join(stopwordremove)  # chuyển lại về chuỗi str
    numberremove_text = ''.join(
        c for c in stopwordremove_text if not c.isdigit())  # bỏ số
    stemmer = PorterStemmer()
    stem_input = nltk.word_tokenize(
        numberremove_text)  # lại phân ra thành mảng
    # chuẩn hóa các từ vựng về từ gốc (lawyers => lawyer ) sau đó nối lại thành str
    stem_text = ' '.join([stemmer.stem(word) for word in stem_input])
    lem_input = nltk.word_tokenize(stem_text)
    lem_text = ' '.join([w for w in lem_input])
    return lem_text

class GetAllNewsAPIView(APIView):
    def get(self, request):
        list_new = News.objects.raw('SELECT * FROM News')
        mydata = GetAllNewsSerializer(list_new,many=True)
        return Response(data=mydata.data,status=status.HTTP_200_OK)


@api_view(['GET'])
def news_list_category(request,pk):
    try:
        sql = "SELECT * FROM News n where n.category = " + pk;
        print(sql)
        news = News.objects.raw(sql)
    except News.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = GetAllNewsSerializer(news,many=True)
        return Response(serializer.data)



