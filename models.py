from flask_sqlalchemy import SQLAlchemy
from app import db

 
class Department(db.Model):
    __tablename__ = 'department'
    dep_code = db.Column('dep_code', db.Integer, primary_key = True)
    dep_name = db.Column(db.String(255))
 
    def __init__(self, dep_code, dep_name):
        self.dep_code = dep_code
        self.dep_name = dep_name
 
    def __repr__(self):
        return f"{self.dep_code}:{self.dep_name}"