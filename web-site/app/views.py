from django.shortcuts import render
from app.models import Patient, Donor, Appointment
from django.shortcuts import render
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

cred = credentials.Certificate('fire-store.json')
firebase_admin.initialize_app(cred)
db = firestore.client()


def HOME(request):
    patient = Patient.objects.count()
    patient_count = int(patient)

    donor = Donor.objects.count()
    donor_count = int(donor)

    appointment = Appointment.objects.count()
    appointment_count = int(appointment)

    appointment_list = Appointment.objects.filter().all()
    return render(request, 'home.html', {'patient_count' : patient_count, 'donor_count' : donor_count, 'appointment_count' : appointment_count, 'appointment_list' : appointment_list})

def ADD_PATIENT(request):
    if request.method == "POST":      

        name = request.POST.get('patient_name')
        surname = request.POST.get('patient_surname')
        id = request.POST.get('patient_id')
        dob = request.POST.get('dob')
        weight = request.POST.get('weight')
        height = request.POST.get('height')
        gender = request.POST.get('gender')
        phone = request.POST.get('phone')
        email = request.POST.get('email')
        blood_type = request.POST.get('blood_type')

        patient = Patient (
            patient_name = name,
            patient_surname = surname,
            id_number = id,
            date_of_birth = dob,
            weight = weight,
            height = height,
            gender = gender,
            phone = phone,
            email = email,
            blood_type = blood_type,
        )

        patient.save()
    
    return render(request, 'patients/add_patient.html')

def SHOW_PATIENT(request):
    if request.method=="POST":
        patient_ids=request.POST.getlist('id[]')
        for id in patient_ids:
            patient = Patient.objects.get(id=id)
            patient.delete()
        return render(request, 'patients/patients.html')
    patient = Patient.objects.filter().all()
    return render(request, 'patients/patients.html', {'patient' : patient})

def ADD_DONOR(request):
    if request.method == "POST":      

        name = request.POST.get('donor_name')
        surname = request.POST.get('donor_surname')
        id = request.POST.get('donor_id')
        dob = request.POST.get('dob')
        weight = request.POST.get('weight')
        height = request.POST.get('height')
        gender = request.POST.get('gender')
        phone = request.POST.get('phone')
        email = request.POST.get('email')
        blood_type = request.POST.get('blood_type')

        donor = Donor (
        donor_name = name,
        donor_surname = surname,
        id_number = id,
        date_of_birth = dob,
        weight = weight,
        height = height,
        gender = gender,
        phone = phone,
        email = email,
        blood_type = blood_type,
        )
        donor.save()

    return render(request, 'donors/add_donor.html')    


def SHOW_DONOR(request):
    if request.method=="POST":
        donor_id =request.POST.getlist('id[]')
        for id in donor_id:
            donor = Donor.objects.get(id=id)
            donor.delete()
        return render(request, 'donors/donors.html')
     
    donor = Donor.objects.filter().all()
    return render(request, 'donors/donors.html', {'donor' : donor})

def ADD_APPOINTMENT(request):
    if request.method == "POST":      

        donor_id = request.POST.get('donor_id')
        date = request.POST.get('appointment_date')
        time = request.POST.get('time_slot')

        appointment = Appointment (
            donor_id = donor_id,
            appointment_date = date,
            appointment_time = time,
        )
        appointment.save() 

    return render(request, 'appointments/add_appointment.html')

def SHOW_APPOINTMENT(request):
    if request.method=="POST":
        appointment_id =request.POST.getlist('id[]')
        for id in appointment_id:
            appointment = Appointment.objects.get(id=id)
            appointment.delete()
        return render(request, 'appointments/appointments.html')
     
    appointment = Appointment.objects.filter().all()
    return render(request, 'appointments/appointments.html', {'appointment' : appointment})

def ADD_EMERGENCY(request):
    if request.method == "POST":
        hospital_name = request.POST.get('hospital_name')
        blood_type = request.POST.get('blood_type')
        hospital_latitude = request.POST.get('hospital_latitude')
        hospital_longitude = request.POST.get('hospital_longitude')

        db.collection('Acil').add({'Hastane_ad':hospital_name, 
                                    'kan':blood_type, 
                                    'latitude':hospital_latitude, 
                                    'longitude':hospital_longitude, 
                                    'timestamp': firestore.SERVER_TIMESTAMP})
    return render(request, 'emergency/add_emergency.html')
