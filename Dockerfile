FROM python:3.10.4-alpine3.15

# copy the requirements file into the image
COPY ./requirements.txt /app/requirements.txt

# switch working directory
WORKDIR /app

# install the dependencies and packages in the requirements file
RUN pip install -r requirements.txt

# copy every content from the local file to the image
COPY ./app.py .

CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0"]