import json
import random
import time
from datetime import datetime

from flask import Flask, Response, render_template, stream_with_context,request,send_from_directory

import subprocess as sp
import os
from werkzeug.utils import secure_filename


app = Flask(__name__)

@app.route("/")
def index():
    return render_template('1.html')




@app.route('/uploader', methods = ['GET', 'POST'])
def upload_file2():
   if request.method == 'POST':


      f = request.files['file']
      f.save(secure_filename(f.filename))

      sp.run(['ffmpeg -y -i '+str(f.filename)+' -f s16le -ar 16000 -ac 1 /opt/kaldi/asr.wav'], shell=True)

      try:
        os.remove(f.filename)
      except Exception:
        pass
        
      return 'Файл успешно загружен! Далее чтобы получить текст, нажмите кнопку Запустить расшифровку.'


@app.route("/key6.jpg", methods=["GET"])
def image():          
    return send_from_directory('/templates/key6.jpg', 'key6.jpg')


@app.route('/stt', methods=['POST', 'GET'])
def stt():
    select = request.form.get('comp_select')
    

    result=''
    if request.method == "POST" and select!='Not_selected':

        t=sp.check_output(["python","/opt/kaldi/test_text.py","/opt/kaldi/asr.wav",select])

        with open('result.txt', 'wb') as f:
            f.write(t)

        with open('result.txt') as f:
            contents = f.read()

    
        result=contents
    else:
        result='Выберите язык для распознования'


    return render_template('1.html', password=result)



if __name__ == '__main__':
    app.run(host = '0.0.0.0', port = 5000,debug=True,threaded=True)

    