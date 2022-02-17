import mysql.connector
from flask import Flask, Response
from flask_principal import Principal, RoleNeed, Permission

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    port="3306",
    database="fypdatabase",
    auth_plugin="mysql_native_password",
    autocommit=True)
mycursor = mydb.cursor()

app = Flask(__name__)
app.config["SECRET_KEY"] = "1234"

principals = Principal(app)

admin_permission = Permission(RoleNeed('admin'))
staff_permission = Permission(RoleNeed('staff'))

from application import admin, supplier, staff, stock, store, user, product