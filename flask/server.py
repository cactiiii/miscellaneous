#!/usr/bin/python
#coding: UTF-8

from flask import Flask, render_template
from flask import request
import sys
import os
from logging import handlers
import logging
from flask.logging import default_handler

app = Flask(__name__)
th= handlers.TimedRotatingFileHandler(filename = "log/log", when = 'D', interval = 1, backupCount=7)
th.setLevel(logging.INFO)
th.setFormatter(logging.Formatter('%(asctime)s [%(module)s] %(levelname)s [%(lineno)d] %(message)s'))
logging.getLogger().addHandler(th)

@app.route('/list')
def list():
    return render_template("index.html", online_fs = online_reses, test_fs = test_reses)

@app.route('/get')
def get():
    return render_template("show.html", lines = lines)

@app.route('/test')
def test():
    return render_template("test.html")
    

if __name__ == "__main__":
    app.run(host = "10.18.96.21", port = 8800)
