#!/usr/bin/env python3

from vosk import Model, KaldiRecognizer
import sys
import json
import os
import argparse




model = Model("/opt/kaldi/model_"+str(sys.argv[2]))

# Large vocabulary free form recognition
rec = KaldiRecognizer(model, 16000)

# You can also specify the possible word list
#rec = KaldiRecognizer(model, 16000, "zero oh one two three four five six seven eight nine")

wf = open(sys.argv[1], "rb")
wf.read(44) # skip header

while True:
    data = wf.read(4000)
    if len(data) == 0:
        break
    if rec.AcceptWaveform(data):
        res = json.loads(rec.Result())
        print (res['text'])

res = json.loads(rec.FinalResult())
with open('result.txt', 'w') as f:
    f.write(res['text'])	
print (res['text'])