FROM python:3.7

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY test.py ./

EXPOSE 80

CMD gunicorn -b 0.0.0.0:80 test:app