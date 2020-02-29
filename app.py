from flask import Flask, render_template,Response,flash, request, redirect, url_for, session
import MySQLdb
from flask_mysqldb import MySQL,MySQLdb
from MySQLdb import escape_string as thwart
import gc
from passlib.hash import sha256_crypt
import yaml
from wtforms import Form, SelectMultipleField
from string import Template


app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'gh5472*1999'
app.config['MYSQL_DB'] = 'flaskapp'

mysql = MySQL(app)
#class LanguageForm(Form):
#    language = SelectMultipleField(u'Programming Language', choices=[('cpp', 'C++'), ('py', 'Python'), ('text', 'Plain Text')])

@app.route('/')
def main():
    return render_template("main.html")
@app.route('/foodinfo')
def foodinfo():
    return render_template("foodinfo.html")

@app.route('/foodmenu')
def foodmenu():
    return render_template("foodmenu.html")

@app.route('/contact')
def contact():
    return render_template("contact.html")
#student form class
class RegisterForm(Form):
    sname = StringField('sname', [validators.Length(min=1, max=50)])
    scode = StringField('scode', [validators.Length(min=4, max=25)])
    semail = StringField('Email', [validators.Length(min=1, max=60)])
    password = PasswordField('Password', [
        validators.DataRequired(),
        validators.EqualTo('confirm', message='Passwords do not match')
    ])
    
    rpassword = PasswordField('Password', [
        validators.DataRequired(),
        validators.EqualTo('confirm', message='Passwords do not match')
    ])
    district=StringField('sname', [validators.Length(min=1, max=50)])
    dcoord=StringField('sname', [validators.Length(min=1, max=50)])
    confirm = PasswordField('Confirm Password')
#health official form class
class RegisterForm(Form):
    hname = StringField('sname', [validators.Length(min=1, max=50)])
    hcode = StringField('scode', [validators.Length(min=4, max=25)])
    hemail = StringField('Email', [validators.Length(min=1, max=60)])
    hpassword = PasswordField('Password', [
        validators.DataRequired(),
        validators.EqualTo('confirm', message='Passwords do not match')
    ])
    
    hrpassword = PasswordField('Password', [
        validators.DataRequired(),
        validators.EqualTo('confirm', message='Passwords do not match')
    ])
    hdistrict=StringField('sname', [validators.Length(min=1, max=50)])
    hcoord=StringField('sname', [validators.Length(min=1, max=50)])
    confirm = PasswordField('Confirm Password')
    
# User Register
@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegisterForm(request.form)
    if request.method == 'POST' and form.validate():
        name = form.name.data
        email = form.email.data
        username = form.username.data
        password = form.password.data

        # Create cursor
        cur = mysql.connection.cursor()

        # Execute query
        cur.execute("INSERT INTO users(name, email, username, password) VALUES(%s, %s, %s, %s)", (name, email, username, password))

        # Commit to DB
        mysql.connection.commit()

        # Close connection
        cur.close()

        flash('You are now registered and can log in', 'success')

        return redirect(url_for('login'))
    return render_template('register.html', form=form)

# health registration pending
@app.route('/hregister', methods=['GET', 'POST'])
def register():
    form = RegisterForm(request.form)
    if request.method == 'POST' and form.validate():
        name = form.name.data
        email = form.email.data
        username = form.username.data
        password = form.password.data

        # Create cursor
        cur = mysql.connection.cursor()

        # Execute query
        cur.execute("INSERT INTO users(name, email, username, password) VALUES(%s, %s, %s, %s)", (name, email, username, password))

        # Commit to DB
        mysql.connection.commit()

        # Close connection
        cur.close()

        flash('You are now registered and can log in', 'success')

        return redirect(url_for('login'))
    return render_template('register.html', form=form)

 #User login
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # Get Form Fields
        username = request.form['username']
        passwordd = request.form['password']

        # Create cursor
        cursor = mysql.connection.cursor()

        # Get user by username
        result = cursor.execute("SELECT * FROM users WHERE username = %s", username)
        if result > 0:
            data = cursor.fetchone()
            password = data[3]

            # Compare Passwords
            if passwordd== password:
                # Passed
                session['logged_in'] = True
                session['username'] = username

                flash('You are now logged in', 'success')
                return redirect(url_for('dashboard'))
            else:
                error = 'Invalid login'
                return render_template('login.html', error=error)
            # Close connection
            cur.close()
        else:
            error = 'Username not found'
            return render_template('login.html', error=error)

    return render_template('login.html')

#check if health official is logged in 
@app.route('/rlogin', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # Get Form Fields
        username = request.form['username']
        passwordd = request.form['password']

        # Create cursor
        cursor = mysql.connection.cursor()

        # Get user by username
        result = cursor.execute("SELECT * FROM users WHERE username = %s", username)
        if result > 0:
            data = cursor.fetchone()
            password = data[3]

            # Compare Passwords
            if passwordd== password:
                # Passed
                session['logged_in'] = True
                session['username'] = username

                flash('You are now logged in', 'success')
                return redirect(url_for('dashboard'))
            else:
                error = 'Invalid login'
                return render_template('login.html', error=error)
            # Close connection
            cur.close()
        else:
            error = 'Username not found'
            return render_template('login.html', error=error)

    return render_template('login.html')


# Check if school is logged in
def is_logged_in(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'logged_in' in session:
            return f(*args, **kwargs)
        else:
            flash('Unauthorized, Please login', 'danger')
            return redirect(url_for('rlogin'))
    return wrap

# Check if school is logged in
def is_logged_in(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'logged_in' in session:
            return f(*args, **kwargs)
        else:
            flash('Unauthorized, Please login', 'danger')
            return redirect(url_for('login'))
    return wrap

# Logout
@app.route('/logout')
@is_logged_in
def logout():
    session.clear()
    flash('You are now logged out', 'success')
    return redirect(url_for('login'))

if __name__== '__main__':
    app.secret_key = "^A%DJAJU^JJ1231"
    app.run(host="0.0.0.0",port='8000',debug=True)
