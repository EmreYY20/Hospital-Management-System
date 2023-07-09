# Import libraries
from flask import Flask, render_template, session, redirect, request, flash
from flask_sqlalchemy import SQLAlchemy

# Initialize app
app = Flask (__name__)

# Config the app for DB connection
app.config['SQLALCHEMY_DATABASE_URI']="postgresql://postgres:1234@database:5432/HMS"
app.config['SECRET_KEY']='thisissecret'

# Create DB
db = SQLAlchemy(app)


####========================Models========================####
class Patients(db.Model):
    __tablename__ = 'patient'
    pid = db.Column('pid', db.Integer, primary_key = True)
    forename = db.Column(db.String(255))
    lastname = db.Column(db.String(255))
    age_sex = db.Column(db.String(255))
    date_of_birth = db.Column(db.String(255))
    address = db.Column(db.String(255))
    phone_number = db.Column(db.String(255))
    date_admitted = db.Column(db.String(255))
    date_discharged = db.Column(db.String(255))
    assigned_doc = db.Column(db.Integer)
    assigned_room = db.Column(db.String(255))
 
    def __init__(self, forename, lastname, age_sex, date_of_birth, address, phone_number, date_admitted, date_discharged, assigned_doc, assigned_room):
        self.forename = forename
        self.lastname = lastname
        self.age_sex = age_sex
        self.date_of_birth = date_of_birth
        self.address = address
        self.phone_number = phone_number
        self.date_admitted = date_admitted
        self.date_discharged = date_discharged
        self.assigned_doc = assigned_doc
        self.assigned_room = assigned_room

class Department(db.Model):
    __tablename__ = 'department'
    dep_code = db.Column('dep_code', db.Integer, primary_key = True)
    dep_name = db.Column(db.String(255))
 
    def __init__(self, dep_code, dep_name):
        self.dep_code = dep_code
        self.dep_name = dep_name
 

class Medicine(db.Model):
    __tablename__ = 'medicine'
    NDC = db.Column('ndc', db.String(255), primary_key = True)
    name = db.Column(db.String(255))
    count = db.Column(db.Integer)
 
    def __init__(self, NDC, name, count):
        self.NDC = NDC
        self.name = name
        self.count = count


class Doctors(db.Model):
    __tablename__ = 'doctor'
    did = db.Column('did', db.Integer, primary_key = True)
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
    room_number = db.Column('room_number', db.String(255), primary_key = True)
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
    nid = db.Column('nid', db.Integer, primary_key = True)
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
    sid = db.Column('sid', db.Integer, primary_key = True)
    surgery_room = db.Column(db.String(255))
    treating_doc = db.Column(db.Integer)
    treated_pat = db.Column(db.Integer)
 
    def __init__(self, surgery_room, treating_doc, treated_pat):
        self.surgery_room = surgery_room
        self.treating_doc = treating_doc
        self.treated_pat = treated_pat


####========================Flask App - Routing========================####
# Dashboard 
@app.route('/')
def index():
    return render_template('dashboard.html')

# Patient
"""
CRUD Patient
"""
@app.route('/patients')
def patients():
    patients = Patients.query.all()
    doctors = Doctors.query.all()
    rooms = Room.query.all() 
    return render_template('patients.html', patients=patients, doctors=doctors, rooms=rooms)

@app.route('/api/patient_count')
def api_patient_count():
    patient_count = Patients.query.count()
    return {"count": patient_count}

@app.route('/patients/<pid>/delete', methods=["GET", 'POST'])
def delete_patient(pid):
    pid = Patients.query.get(pid)
    if pid:
        db.session.delete(pid)
        db.session.commit()
        flash('Patient deleted successfully.')
    return redirect("/patients")

@app.route('/patients/<pid>/edit', methods=['GET', 'POST'])
def edit_patient(pid):
    patient = Patients.query.get(pid)

    if request.method == 'POST':
        # Update the patient's information with the submitted form data
        patient.forename = request.form['forename']
        patient.lastname = request.form['lastname']
        patient.age_sex = request.form['age_sex']
        patient.date_of_birth = request.form['dob']
        patient.address = request.form['address']
        patient.date_admitted = request.form['admitted']
        patient.date_discharged = request.form['discharged']
        patient.phone_number = request.form['phone']

        # Save the changes to the database
        db.session.commit()

        # Redirect the user back to the patients listing page or a specific route
        return redirect("/patients")

    return render_template('edit_patient.html', patient=patient)

@app.route('/add_patient', methods=['POST'])
def add_patient():
    forename = request.form['forename']
    lastname = request.form['lastname']
    age_sex = request.form['age_sex']
    date_of_birth = request.form['date_of_birth']
    address = request.form['address']
    date_admitted = request.form['date_admitted']
    date_discharged = request.form['date_discharged']
    phone_number = request.form['phone_number']
    assigned_doc = request.form['assigned_doc']
    assigned_room = request.form['assigned_room']

    new_patient = Patients(forename=forename, lastname=lastname, 
                           age_sex=age_sex, date_of_birth=date_of_birth, address=address, phone_number=phone_number, 
                           date_admitted=date_admitted, date_discharged=date_discharged, assigned_doc=assigned_doc,
                           assigned_room=assigned_room)
    db.session.add(new_patient)
    db.session.commit()

    return redirect('/patients')

# Department
"""
CRUD Department
"""
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

@app.route('/departments/<dep_code>/edit', methods=['POST'])
def edit_department(dep_code):
    dep = Department.query.get(dep_code)

    if request.method == 'POST':
        dep.dep_code = request.form['dep_code']
        dep.dep_name = request.form['dep_name']

        # Save the changes to the database
        db.session.commit()

        # Redirect the user back to the patients listing page or a specific route
        return redirect("/departments")

@app.route('/add_department', methods=['POST'])
def add_department():
    dep_code = request.form['dep_code']
    dep_name = request.form['dep_name']

    new_dep = Department(dep_code=dep_code, dep_name=dep_name)
    db.session.add(new_dep)
    db.session.commit()

    return redirect('/departments')

# Medicine
"""
CRUD Medicine
"""
@app.route('/medicine')
def medicine():
    med = Medicine.query.all()
    return render_template('medicine.html', med=med)

@app.route('/medicine/<mid>/delete', methods=["GET", 'POST'])
def delete_medicine(mid):
    mid = Medicine.query.get(mid)
    if mid:
        db.session.delete(mid)
        db.session.commit()
        flash('Medicine deleted successfully.')
    return redirect("/medicine")

@app.route('/medicine/<mid>/edit', methods=['GET', 'POST'])
def edit_medicine(mid):
    med = Medicine.query.get(mid)

    if request.method == 'POST':
        # Update the medicine information with the submitted form data
        med.name = request.form['name']
        med.count = request.form['count']

        # Save the changes to the database
        db.session.commit()

        # Redirect the user back to the patients listing page or a specific route
        return redirect("/medicine")

@app.route('/add_medicine', methods=["GET",'POST'])
def add_medicine():
    NDC = request.form['NDC']
    name = request.form['name']
    count = request.form['count']

    new_med = Medicine(NDC=NDC, name=name, count=count)
    db.session.add(new_med)
    db.session.commit()

    return redirect('/medicine')

# Doctor
"""
CRUD Doctor
"""
@app.route('/doctors')
def doctors():
    doctors = Doctors.query.all()
    departments = Department.query.with_entities(Department.dep_code).all()

     # Fetch the list of assigned patient IDs for each doctor
    assigned_patients = {}
    for doc in doctors:
        assigned_patients[doc.did] = [patient.pid for patient in Patients.query.filter_by(assigned_doc=doc.did).all()]

    return render_template('doctors.html', doctors=doctors, departments=departments, assigned_patients=assigned_patients)

@app.route('/api/doctor_count')
def api_doctor_count():
    doctor_count = Doctors.query.count()
    return {"count": doctor_count}

@app.route('/doctors/<did>/delete', methods=["GET", 'POST'])
def delete_doctor(did):
    did = Doctors.query.get(did)
    if did:
        db.session.delete(did)
        db.session.commit()
        flash('Doctor deleted successfully.')
    return redirect("/doctors")

@app.route('/doctors/<did>/edit', methods=['GET', 'POST'])
def edit_doctor(did):
    doctors = Doctors.query.get(did)

    if request.method == 'POST':
        # Update the patient's information with the submitted form data
        doctors.forename = request.form['forename']
        doctors.lastname = request.form['lastname']
        doctors.date_of_birth = request.form['dob']
        doctors.address = request.form['address']
        doctors.phone_number = request.form['phone']
        doctors.dep = request.form['dep']

        # Save the changes to the database
        db.session.commit()

        # Redirect the user back to the patients listing page or a specific route
        return redirect("/doctors")

    return render_template('edit_doctors.html', doctors=doctors)

@app.route('/add_doctor', methods=['POST'])
def add_doctor():
    forename = request.form['forename']
    lastname = request.form['lastname']
    date_of_birth = request.form['date_of_birth']
    address = request.form['address']
    phone_number = request.form['phone_number']
    department = request.form['dep']

    new_doc = Doctors(forename=forename, lastname=lastname, date_of_birth=date_of_birth, address=address, phone_number=phone_number, department=department)
    db.session.add(new_doc)
    db.session.commit()

    return redirect('/doctors')

# Nurse
"""
CRUD Nurse
"""
@app.route('/api/nurse_count')
def api_nurse_count():
    nurse_count = Nurse.query.count()
    return {"count": nurse_count}

@app.route('/nurse')
def nurse():
    nurse = Nurse.query.all()
    return render_template('nurse.html', nurse=nurse)

@app.route('/nurse/<nid>/delete', methods=["GET", 'POST'])
def delete_nurse(nid):
    nid = Nurse.query.get(nid)
    if nid:
        db.session.delete(nid)
        db.session.commit()
        flash('Nurse deleted successfully.')
    return redirect("/nurse")

@app.route('/nurse/<nid>/edit', methods=['GET', 'POST'])
def edit_nurse(nid):
    nurse = Nurse.query.get(nid)

    if request.method == 'POST':
        # Update the patient's information with the submitted form data
        nurse.forename = request.form['forename']
        nurse.lastname = request.form['lastname']
        nurse.date_of_birth = request.form['dob']
        nurse.address = request.form['address']
        nurse.phone_number = request.form['phone']

        # Save the changes to the database
        db.session.commit()

        # Redirect the user back to the patients listing page or a specific route
        return redirect("/nurse")

@app.route('/add_nurse', methods=['POST'])
def add_nurse():
    forename = request.form['forename']
    lastname = request.form['lastname']
    date_of_birth = request.form['date_of_birth']
    address = request.form['address']
    phone_number = request.form['phone_number']

    new_nurse = Nurse(forename=forename, lastname=lastname, date_of_birth=date_of_birth, address=address, phone_number=phone_number)
    db.session.add(new_nurse)
    db.session.commit()

    return redirect('/nurse')

# Rooms
"""
CRUD Room
"""
@app.route('/rooms')
def rooms():
    rooms = Room.query.all()
    return render_template('rooms.html', rooms=rooms)

@app.route('/rooms/<room_number>/delete', methods=["GET", 'POST'])
def delete_room(room_number):
    room_number = Room.query.get(room_number)
    if room_number:
        db.session.delete(room_number)
        db.session.commit()
    return redirect("/rooms")

@app.route('/rooms/<room_number>/edit', methods=['GET', 'POST'])
def edit_rooms(room_number):
    rooms = Room.query.get(room_number)

    if request.method == 'POST':
        # Update the patient's information with the submitted form data
        rooms.capactiy = request.form['capacity']
        rooms.free_of_it = request.form['free_of_it']

        # Save the changes to the database
        db.session.commit()

        # Redirect the user back to the patients listing page or a specific route
        return redirect("/rooms")

@app.route('/add_room', methods=['POST'])
def add_room():
    room_number = request.form['room_number']
    capacity = request.form['capacity']
    free_of_it = request.form['free_of_it']

    new_room = Room(room_number=room_number, capacity=capacity, free_of_it=free_of_it)
    db.session.add(new_room)
    db.session.commit()

    return redirect('/rooms')

# Surgery
"""
CRUD Surgery
"""
@app.route('/api/surgery_count')
def api_surgery_count():
    surgery_count = Surgeries.query.count()
    return {"count": surgery_count}

@app.route('/surgeries')
def surgery():
    surgeries = Surgeries.query.all()
    return render_template('surgeries.html', surgeries=surgeries)

@app.route('/surgeries/<sid>/delete', methods=["GET", 'POST'])
def delete_surgery(sid):
    sid = Surgeries.query.get(sid)
    if sid:
        db.session.delete(sid)
        db.session.commit()
    return redirect("/surgeries")

@app.route('/surgeries/<sid>/edit', methods=['GET', 'POST'])
def edit_surgery(sid):
    surgeries = Surgeries.query.get(sid)

    if request.method == 'POST':
        # Update the patient's information with the submitted form data
        surgeries.surgery_room = request.form['Surgery_Room']
        surgeries.treating_doc = request.form['Treating_Doctor']
        surgeries.treated_pat = request.form['Treated_Patient']

        # Save the changes to the database
        db.session.commit()

        # Redirect the user back to the patients listing page or a specific route
        return redirect("/surgeries")

@app.route('/add_surgery', methods=['POST'])
def add_surgery():
    surgery_room = request.form['Surgery_Room']
    treating_doc = request.form['Treating_Doctor']
    treated_pat = request.form['Treated_Patient']

    new_surgery = Surgeries(surgery_room=surgery_room, treating_doc=treating_doc, treated_pat=treated_pat)
    db.session.add(new_surgery)
    db.session.commit()

    return redirect('/surgeries')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000 , debug=True)