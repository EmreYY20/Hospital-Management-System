from flask import Flask, url_for, render_template, session, redirect, request, flash
from flask_sqlalchemy import SQLAlchemy
#from flask_wtf import FlaskForm
#from wtforms import StringField, SubmitField
#from wtforms.validators import DataRequired
import os

# Initialize app
app = Flask (__name__)

# Config 
app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://postgres:2002@localhost:5432/HMS"
app.config['SECRET_KEY'] = 'thisissecret'

#bootstrap = Bootstrap(app)
db = SQLAlchemy(app)

### Models ###
class Patients(db.Model):
    __tablename__ = 'patient'
    pid = db.Column('PID', db.Integer, primary_key = True)
    forename = db.Column(db.String(255))
    lastname = db.Column(db.String(255))
    age_sex = db.Column(db.String(255))
    date_of_birth = db.Column(db.String(255))
    address = db.Column(db.String(255))
    phone_number = db.Column(db.String(255))
    date_admitted = db.Column(db.String(255))
    date_discharged = db.Column(db.String(255))

 
    def __init__(self, forename, lastname, age_sex, date_of_birth, address, phone_number, date_admitted, date_discharged):
        self.forename = forename
        self.lastname = lastname
        self.age_sex = age_sex
        self.date_of_birth = date_of_birth
        self.address = address
        self.phone_number = phone_number
        self.date_admitted = date_admitted
        self.date_discharged = date_discharged

 
    #def __repr__(self):
    #    return f"{self.dep_code}:{self.dep_name}"

class Department(db.Model):
    __tablename__ = 'department'
    dep_code = db.Column('dep_code', db.Integer, primary_key = True)
    dep_name = db.Column(db.String(255))
 
    def __init__(self, dep_code, dep_name):
        self.dep_code = dep_code
        self.dep_name = dep_name
 
    #def __repr__(self):
    #    return f"{self.dep_code}:{self.dep_name}"

class Medicince(db.Model):
    __tablename__ = 'medicine'
    NDC = db.Column('NDC', db.String(255), primary_key = True)
    name = db.Column(db.String(255))
    count = db.Column(db.Integer)
 
    def __init__(self, NDC, name, count):
        self.NDC = NDC
        self.name = name
        self.count = count

class Doctors(db.Model):
    __tablename__ = 'doctor'
    did = db.Column('DID', db.Integer, primary_key = True)
    forename = db.Column(db.String(255))
    lastname = db.Column(db.String(255))
    date_of_birth = db.Column(db.String(255))
    address = db.Column(db.String(255))
    phone_number = db.Column(db.String(255))
    department = db.Column(db.String(255))
    
    def __init__(self, forename, lastname, date_of_birth, address, phone_number, department):
        self.forename = forename
        self.lastname = lastname
        self.date_of_birth = date_of_birth
        self.address = address
        self.phone_number = phone_number
        self.department = department

class Room(db.Model):
    __tablename__ = 'room'
    room_number = db.Column('room_number', db.String(255), primary_key = True)
    capacity = db.Column(db.Integer)
    free_of_it = db.Column(db.Integer)
 
    def __init__(self, room_number, capacity, free_of_it):
        self.room_number = room_number
        self.cap = capacity
        self.free_of_it = free_of_it
    
class Nurse(db.Model):
    __tablename__ = 'nurse'
    nid = db.Column('NID', db.Integer, primary_key = True)
    forename = db.Column(db.String(255))
    lastname = db.Column(db.String(255))
    date_of_birth = db.Column(db.String(255))
    address = db.Column(db.String(255))
    phone_number = db.Column(db.String(255))
    
    def __init__(self, forename, lastname, date_of_birth, address, phone_number):
        self.forename = forename
        self.lastname = lastname
        self.date_of_birth = date_of_birth
        self.address = address
        self.phone_number = phone_number
        
### Routing ###
@app.route('/login')
def login():
    return render_template('login.html')

# Dashboard
@app.route('/dashboard')
def index():
    return render_template('dashboard.html')

# Patient
@app.route('/patients')
def patients():
    patients = Patients.query.all()
    patients_count = len(patients)
    return render_template('patients.html', patients=patients, patients_count=patients_count)

# Department
@app.route('/departments')
def departments():
    deps = Department.query.all()
    return render_template('departments.html', deps=deps)

@app.route('/departments/<dep_code>/delete', methods=["GET", 'POST'])
def delete_department(dep_code):
    department = Department.query.get(dep_code)
    if department:
        db.session.delete(department)
        db.session.commit()
        flash('Department deleted successfully.', 'success')
    return redirect("/departments")

# Medicine
@app.route('/medicine')
def medicine():
    med = Medicince.query.all()
    return render_template('medicine.html', med=med)

# Doctor
@app.route('/doctors')
def doctors():
    docs = Doctors.query.all()
    return render_template('doctors.html', docs=docs)

@app.route('/doctor/dashboard')
def doctor():
    docs = Doctors.query.all()
    return render_template('/doctor/dashboard.html')

# Nurse
@app.route('/nurse')
def nurse():
    nurse = Nurse.query.all()
    return render_template('nurse.html', nurse=nurse)

# Rooms
@app.route('/rooms')
def rooms():
    rooms = Room.query.all()
    return render_template('rooms.html', rooms=rooms)

if __name__ == '__main__':
    app.run(debug=True)