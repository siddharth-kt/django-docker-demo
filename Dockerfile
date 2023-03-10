# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app
# /app is also used in docker-compose.yaml file to sync host and container.

COPY requirements.txt requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

COPY . .

# this(port:8000) is also used in docker-compose.yaml file
CMD [ "python3", "manage.py" , "runserver", "0.0.0.0:8000"]
