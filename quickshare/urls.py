from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]

#Qua posso inseire erase_db() e poi init_db per inserire dei valori di default nel db al prima avvio