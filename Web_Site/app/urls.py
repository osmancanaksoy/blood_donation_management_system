from django.contrib import admin
from django.urls import path
from app import views

urlpatterns = [
    path('patient/add', views.ADD_PATIENT, name='add_patient'),
    path('patient/show', views.SHOW_PATIENT, name='show_patient'),
    path('donor/add', views.ADD_DONOR, name='add_donor'),
    path('donor/show', views.SHOW_DONOR, name='show_donor'),
    path('appointment/add', views.ADD_APPOINTMENT, name="add_appointment"),
    path('appointment/show', views.SHOW_APPOINTMENT, name="show_appointment"),
    path('emergency/add', views.ADD_EMERGENCY, name="add_emergency"),
]