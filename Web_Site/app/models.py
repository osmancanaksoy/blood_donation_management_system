from django.db import models
from django.core.validators import MaxValueValidator

# Create your models here.

class Patient(models.Model):
    donor_id = models.AutoField(primary_key=True, editable=False)
    patient_name = models.CharField(max_length=25)
    patient_surname = models.CharField(max_length=25)
    id_number = models.CharField(max_length=11)
    date_of_birth = models.CharField(max_length=10)
    weight = models.IntegerField()
    height = models.IntegerField()
    gender = models.CharField(max_length=5)
    blood_type = models.CharField(max_length=3)
    phone = models.CharField(max_length=11)
    email = models.CharField(max_length=25)

    def __str__(self):
        return self.patient_name

class Donor(models.Model):
    donor_id = models.AutoField(primary_key=True, editable=False)
    donor_name = models.CharField(max_length=25)
    donor_surname = models.CharField(max_length=25)
    id_number = models.CharField(max_length=11)
    date_of_birth = models.CharField(max_length=10)
    weight = models.IntegerField()
    height = models.IntegerField()
    gender = models.CharField(max_length=5)
    blood_type = models.CharField(max_length=3)
    phone = models.CharField(max_length=11)
    email = models.CharField(max_length=25)

    def __str__(self):
        return self.donor_name

class Appointment(models.Model):
    appointment_id = models.AutoField(primary_key=True, editable=False)
    donor = models.ForeignKey(Donor, on_delete=models.PROTECT)
    appointment_date = models.CharField(max_length=10)
    appointment_time = models.CharField(max_length=15)
    
    def __str__(self):
        return self.appointment_id    




    