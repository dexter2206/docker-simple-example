FROM ubuntu:20.04
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y python3 python3-pip

COPY requirements.txt ./
RUN pip3 install -r requirements.txt

COPY test.py ./

EXPOSE 80

CMD gunicorn --worker-tmp-dir /dev/shm -b 0.0.0.0:80 test:app