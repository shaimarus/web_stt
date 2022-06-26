FROM python:3.9
RUN apt-get update && apt-get install -y ffmpeg
#RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/listls/*
RUN mkdir /opt/kaldi/
COPY . /opt/kaldi/


RUN pip3 install -r /opt/kaldi/requirements.txt
#RUN pip3 --no-cache-dir install -r /opt/kaldi/requirements.txt


RUN unzip /opt/kaldi/vosk-model-kz-0.15.zip -d /opt/kaldi/ && rm -rf /opt/kaldi/vosk-model-kz-0.15.zip && mv /opt/kaldi/vosk-model-kz-0.15 /opt/kaldi/model_kaz
RUN unzip /opt/kaldi/vosk-model-small-ru-0.22.zip -d /opt/kaldi/ && rm -rf /opt/kaldi/vosk-model-small-ru-0.22.zip && mv /opt/kaldi/vosk-model-small-ru-0.22 /opt/kaldi/model_rus
RUN unzip /opt/kaldi/vosk-model-small-en-us-zamia-0.5.zip -d /opt/kaldi/ && rm -rf /opt/kaldi/vosk-model-small-en-us-zamia-0.5.zip && mv /opt/kaldi/vosk-model-small-en-us-zamia-0.5 /opt/kaldi/model_eng
RUN unzip /opt/kaldi/vosk-model-small-cn-0.22.zip -d /opt/kaldi/ && rm -rf /opt/kaldi/vosk-model-small-cn-0.22.zip && mv /opt/kaldi/vosk-model-small-cn-0.22 /opt/kaldi/model_cn
RUN unzip /opt/kaldi/vosk-model-small-uk-v3-small.zip -d /opt/kaldi/ && rm -rf /opt/kaldi/vosk-model-small-uk-v3-small.zip && mv /opt/kaldi/vosk-model-small-uk-v3-small /opt/kaldi/model_uk
RUN unzip /opt/kaldi/vosk-model-small-fr-0.22.zip -d /opt/kaldi/ && rm -rf /opt/kaldi/vosk-model-small-fr-0.22.zip && mv /opt/kaldi/vosk-model-small-fr-0.22 /opt/kaldi/model_fr
RUN unzip /opt/kaldi/vosk-model-small-de-0.15.zip -d /opt/kaldi/ && rm -rf /opt/kaldi/vosk-model-small-de-0.15.zip && mv /opt/kaldi/vosk-model-small-de-0.15 /opt/kaldi/model_de
RUN unzip /opt/kaldi/vosk-model-small-tr-0.3.zip -d /opt/kaldi/ && rm -rf /opt/kaldi/vosk-model-small-tr-0.3.zip && mv /opt/kaldi/vosk-model-small-tr-0.3 /opt/kaldi/model_tr
RUN unzip /opt/kaldi/vosk-model-small-it-0.4.zip -d /opt/kaldi/ && rm -rf /opt/kaldi/vosk-model-small-it-0.4.zip && mv /opt/kaldi/vosk-model-small-it-0.4 /opt/kaldi/model_it
RUN unzip /opt/kaldi/vosk-model-small-es-0.22.zip -d /opt/kaldi/ && rm -rf /opt/kaldi/vosk-model-small-es-0.22.zip && mv /opt/kaldi/vosk-model-small-es-0.22 /opt/kaldi/model_es
RUN unzip /opt/kaldi/vosk-model-small-ja-0.22.zip -d /opt/kaldi/ && rm -rf /opt/kaldi/vosk-model-small-ja-0.22.zip && mv /opt/kaldi/vosk-model-small-ja-0.22 /opt/kaldi/model_ja
RUN unzip /opt/kaldi/vosk-model-ar-mgb2-0.4.zip -d /opt/kaldi/ && rm -rf /opt/kaldi/vosk-model-ar-mgb2-0.4.zip && mv /opt/kaldi/vosk-model-ar-mgb2-0.4 /opt/kaldi/model_ar

WORKDIR /opt/kaldi/

