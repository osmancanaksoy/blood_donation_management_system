# Generated by Django 3.2.16 on 2022-12-13 21:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Donor',
            fields=[
                ('donor_id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('donor_name', models.CharField(max_length=25)),
                ('donor_surname', models.CharField(max_length=25)),
                ('id_number', models.CharField(max_length=11)),
                ('date_of_birth', models.CharField(max_length=10)),
                ('weight', models.IntegerField()),
                ('height', models.IntegerField()),
                ('gender', models.CharField(max_length=5)),
                ('blood_type', models.CharField(max_length=3)),
                ('phone', models.CharField(max_length=11)),
                ('email', models.CharField(max_length=25)),
            ],
        ),
        migrations.CreateModel(
            name='Patient',
            fields=[
                ('donor_id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('patient_name', models.CharField(max_length=25)),
                ('patient_surname', models.CharField(max_length=25)),
                ('id_number', models.CharField(max_length=11)),
                ('date_of_birth', models.CharField(max_length=10)),
                ('weight', models.IntegerField()),
                ('height', models.IntegerField()),
                ('gender', models.CharField(max_length=5)),
                ('blood_type', models.CharField(max_length=3)),
                ('phone', models.CharField(max_length=11)),
                ('email', models.CharField(max_length=25)),
            ],
        ),
        migrations.CreateModel(
            name='Appointment',
            fields=[
                ('appointment_id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('appointment_date', models.CharField(max_length=10)),
                ('appointment_time', models.CharField(max_length=15)),
                ('donor', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='app.donor')),
            ],
        ),
    ]
