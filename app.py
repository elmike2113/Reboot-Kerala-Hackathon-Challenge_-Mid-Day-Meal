from flask import Flask, render_template,Response,flash, request, redirect, url_for, session
import MySQLdb
from flask_mysqldb import MySQL,MySQLdb
from MySQLdb import escape_string as thwart
import gc
from passlib.hash import sha256_crypt
import yaml
from wtforms import Form, SelectMultipleField
from string import Template


HTML_TEMPLATE = Template("""
<h1>Hello ${place_name}!</h1>

<img src="https://maps.googleapis.com/maps/api/staticmap?size=700x300&markers=${place_name}" alt="map of ${place_name}">

<img src="https://maps.googleapis.com/maps/api/streetview?size=700x300&location=${place_name}" alt="street view of ${place_name}">
""")


app = Flask(__name__)

db= yaml.load(open('db.yaml'),Loader=yaml.FullLoader)
app.config['MYSQL-HOST']=db['mysql_host']
app.config['MYSQL_USER']=db['mysql_user']
app.config['MYSQL_PASSWORD']=db['mysql_password']
app.config['MYSQL_DB']=db['mysql_db']

#class LanguageForm(Form):
#    language = SelectMultipleField(u'Programming Language', choices=[('cpp', 'C++'), ('py', 'Python'), ('text', 'Plain Text')])

def connection():
    conn = MySQLdb.connect(host= 'localhost',
                           user = 'root',
                           passwd = 'gh5472*1999',
                           db = 'flaskapp')
    c = conn.cursor()
    return c, conn
mysql = MySQL(app)

@app.route('/main')
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

@app.route('/register',methods=["GET","POST"])
def register():
    return render_template("register.html")
    form= request.form
    if request.method == "POST":
        sname = form['name']
        scode=form['scode']
        semail = form['semail']
        password = form['password']
        district= form['district']
        dcoord=form['dcoord']
        ph=form['phone']
        princi=form['princi']
        schooltotalstud=form['schooltotalstud']
        numberstudentsmdm=form['numberstudentsmdm']
        rpassword= form['rpassword']
        c, conn = connection()

        x = c.execute("SELECT * FROM registers WHERE scode = %s",scode)

        if int(x) > 0:
            return "This school code is already taken, please login into your account"
            #return render_template("register.html")

        else:
            c.execute("INSERT INTO registers(scode, sname, semail, password,district, dcoord, ph, princi, schooltotalstud, numberstudentsmdm, rpassword) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",(scode, sname, semail, password, district, dcoord, ph, princi, schooltotalstud, numberstudentsmdm, rpassword))

            conn.commit()
            return render_template("main.html")
            c.close()
            conn.close()
            gc.collect()

            session['logged_in'] = True
            session['scode'] = scode
            session['sname'] = sname
            session['semail'] =semail
            session['password']=password
            session['district']=ph
            session['princi']=princi
            session['schooltotalstud']=schooltotalstud
            session['numberstudentsmdm']=numberstudentsmdm

            return "success"
            #return render_template("register.html")

    #return render_template("register.html")
@app.route('/login',methods=["GET","POST"])
def login():
    msg=''
    return render_template("logout.html")
    if request.method == 'POST':
        form=request.form
        scode = form['scode']
        password = form['password']
        sname = form['sname']
        semail = form['semail']
        password = form['password']
        district= form['district']
        dcoord=form['dcoord']
        ph=form['phone']
        princi=form['princi']
        schooltotalstud=form['schooltotalstud']
        numberstudentsmdm=form['numberstudentsmdm']
        curl = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        #cur.execute("INSERT INTO register(email,password) VALUES(%s, %s)",(email,email))
        curl.execute("SELECT * FROM registers WHERE scode=%s AND password=%s",(scode,password))
        user = curl.fetchone()
        curl.close()
        if user:
            return render_template('logout.html')
            session['loggedin'] = True
            session['scode'] = user['scode']
            session['password'] = user['password']
            session['scode'] = scode
            session['sname'] = sname
            session['semail'] =semail
            session['password']=password
            session['district']=ph
            session['princi']=princi
            session['schooltotalstud']=schooltotalstud
            session['numberstudentsmdm']=numberstudentsmdm
        else:

            return render_template('main.html')
    return render_template('main.html')




if __name__== '__main__':
    app.secret_key = "^A%DJAJU^JJ1231"
    app.run(host="0.0.0.0",port='8000',debug=True)
