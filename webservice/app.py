from flask import Flask,request,url_for,jsonify
import hashlib
import pymysql.cursors
conn=cursor=None
app=Flask(__name__)
@app.route('/')
def index():
    return "hola"
if __name__=="__main__":
    app.run(debug=True)