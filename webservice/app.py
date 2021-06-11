from flask import Flask,request,url_for,jsonify
import decimal
import flask.json
import hashlib
import datetime 
import pymysql.cursors
class MyJSONEncoder(flask.json.JSONEncoder):

    def default(self, obj):
        print(str(obj))
        if isinstance(obj, decimal.Decimal):
            # Convert decimal instances to strings.
            return str(obj)
        if isinstance(obj, (datetime.date, datetime.datetime,datetime.timedelta)):
            return ""+str(obj)+""
        return super(MyJSONEncoder, self).default(obj)
conn=cursor=None
def openDb():
    global conn,cursor
    conn=pymysql.connect(host="localhost",user="root",password="",database="futbook")
    cursor=conn.cursor(pymysql.cursors.DictCursor)
def closeDb():
    cursor.close()
    conn.close()
app=Flask(__name__)
app.json_encoder = MyJSONEncoder
@app.route('/')
def index():
    return "hola"
@app.route('/fields')
def getFields():
   openDb()
   container=[]
   cursor.execute("Select * from field")
   data=cursor.fetchall()
   for field in data:
       container.append(field)
   closeDb()
   return jsonify(container)
@app.route('/profile/<id>/book')
def getBookList(id):
   openDb()
   container=[]
   cursor.execute("Select * from booking natural join field where id_account=%s",(id))
   data=cursor.fetchall()
   for order in data:
       order.pop("description",None)
       order.pop("location",None)
       order.pop("pictures",None)
       order.pop("count_field",None)
       order.pop("price_per_hour",None)
       container.append(order)
   closeDb()
   return jsonify(container)
@app.route('/auth/login', methods=['POST'])
def login():
   map=request.form
   password=hashlib.sha1(map['password'].encode()).hexdigest()
   sql="select count(*) as result,email,id_account as uid from account where email=%s AND password=%s"
   val=(map['email'],password)
   openDb()
   cursor.execute(sql,val)
   result = cursor.fetchone()
   result['message']="Login Success" if result['result']==1 else "login not success"
   if(result['result']==1):
       result['data']={
           "email":result['email'],
           "uid":result['uid'],
       }
   closeDb()
   return result

@app.route('/auth/register', methods=['POST'])
def register():
   map=request.form
   sql="select count(*) as result from account where email=%s"
   val=(map['email'])
   openDb()
   cursor.execute(sql,val)
   result=cursor.fetchone()
   if (result['result']>0):
       closeDb()
       result['message']="email has been used"
       result['result']=0
       return jsonify(result)
   else:
       password=hashlib.sha1(map['password'].encode()).hexdigest()
       sql="INSERT INTO `account`"
       sql+="(`email`, `password`)"
       sql+=" VALUES (%s,%s)"
       val=(map['email'],password)
       cursor.execute(sql,val)
       conn.commit()
       sql="select count(email) as result,email,id_account as uid from account where email=%s AND password=%s"
       val=(map['email'],password)
       cursor.execute(sql,val)
       results={

       }
       result = cursor.fetchone()
       if(result['result']==1):
            results['data']={
                "email":result['email'],
                "uid":result['uid'],
            } 
       closeDb()
       results['result']=1
       results['message']="register success"
       return jsonify(results)

@app.route('/profile/<id>/details')
def getProfile(id):
   sql="SELECT * FROM `profile` WHERE id_account=%s"
   openDb()
   cursor.execute(sql,(id))
   data=cursor.fetchone()
   closeDb()
   if data==None:
       return jsonify({})
   return jsonify(data)

@app.route('/profile/<id>/order/make', methods=['POST'])
def makeorder(id):
   map=request.form
   sql="INSERT INTO `booking`( `id_account`, `id_field`, `date`, `time_start`, `time_end`, `total_fee`, `notes`)"
   sql+=" VALUES (%s,%s,%s,%s,%s,%s,%s)"
   val=(id,map['id_field'],map['date'],map['time_start'],map['time_end'],map['total_fee'],map['notes'])
   cursor.execute(sql,val)
   conn.commit()
   return jsonify({
       "message":"success processing your order",
       "result":True
   })

if __name__=="__main__":
    app.run(debug=True)

