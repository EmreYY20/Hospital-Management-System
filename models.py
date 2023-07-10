from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Patients(db.Model):
    __tablename__ = 'patient'
    pid = db.Column('pid', db.Integer, primary_key=True)
    forename = db.Column(db.String(255))
    lastname = db.Column(db.String(255))
    age = db.Column(db.Integer)
    sex = db.Column(db.String(1))
    date_of_birth = db.Column(db.String(255))
    address = db.Column(db.String(255))
    phone_number = db.Column(db.String(255))
    date_admitted = db.Column(db.String(255))
    date_discharged = db.Column(db.String(255))
    assigned_doc = db.Column(db.Integer)
    assigned_room = db.Column(db.String(255))
 
    def __init__(self, forename, lastname, age, sex, date_of_birth, address, phone_number, date_admitted, date_discharged, assigned_doc, assigned_room):
        self.forename = forename
        self.lastname = lastname
        self.age = age
        self.sex = sex
        self.date_of_birth = date_of_birth
        self.address = address
        self.phone_number = phone_number
        self.date_admitted = date_admitted
        self.date_discharged = date_discharged
        self.assigned_doc = assigned_doc
        self.assigned_room = assigned_room

class Department(db.Model):
    __tablename__ = 'department'
    dep_code = db.Column('dep_code', db.Integer, primary_key=True)
    dep_name = db.Column(db.String(255))
 
    def __init__(self, dep_code, dep_name):
        self.dep_code = dep_code
        self.dep_name = dep_name
 

class Medicine(db.Model):
    __tablename__ = 'medicine'
    NDC = db.Column('ndc', db.String(255), primary_key=True)
    name = db.Column(db.String(255))
    count = db.Column(db.Integer)
 
    def __init__(self, NDC, name, count):
        self.NDC = NDC
        self.name = name
        self.count = count


class Doctors(db.Model):
    __tablename__ = 'doctor'
    did = db.Column('did', db.Integer, primary_key=True)
    forename = db.Column(db.String(255))
    lastname = db.Column(db.String(255))
    date_of_birth = db.Column(db.String(255))
    address = db.Column(db.String(255))
    phone_number = db.Column(db.String(255))
    department = db.Column(db.String(255))
    assigned_patients = db.Column(db.Integer)
    
    def __init__(self, forename, lastname, date_of_birth, address, phone_number, department, assigned_patients):
        self.forename = forename
        self.lastname = lastname
        self.date_of_birth = date_of_birth
        self.address = address
        self.phone_number = phone_number
        self.department = department
        self.assigned_patients = assigned_patients


class Room(db.Model):
    __tablename__ = 'room'
    room_number = db.Column('room_number', db.String(255), primary_key=True)
    capacity = db.Column(db.Integer)
    free_of_it = db.Column(db.Integer)
    #nurse_id = db.Column(db.Integer, db.ForeignKey('nurse.nid'))
 
    def __init__(self, room_number, capacity, free_of_it):
        self.room_number = room_number
        self.capacity = capacity
        self.free_of_it = free_of_it
        #self.nurse_id = nurse_id
 

class Nurse(db.Model):
    __tablename__ = 'nurse'
    nid = db.Column('nid', db.Integer, primary_key=True)
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


class Surgeries(db.Model):
    __tablename__ = 'surgeries'
    sid = db.Column('sid', db.Integer, primary_key=True)
    surgery_room = db.Column(db.String(255))
    treating_doc = db.Column(db.Integer)
    treated_pat = db.Column(db.Integer)
 
    def __init__(self, surgery_room, treating_doc, treated_pat):
        self.surgery_room = surgery_room
        self.treating_doc = treating_doc
        self.treated_pat = treated_pat
