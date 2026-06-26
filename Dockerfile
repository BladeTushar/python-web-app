FROM python:3.10-slim

#setting env variables
#to prevent caching and excessive disk usage[O
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1          

#setting up working dir

WORKDIR /app

#Copying req files 
COPY requirements.txt /app/

#install dependecnies
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8000

#start the django app
CMD ["python", "devops/manage.py", "runserver", "0.0.0.0:8000"]
