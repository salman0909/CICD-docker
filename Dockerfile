FROM python:3.9-alpine

WORKDIR /flask_app

COPY requirements.txt .
RUN pip3 install Flask
RUN pip3 install --no-cache-dir -r requirements.txt

RUN pip3 install pytest

COPY app/ .

COPY tests/ app/tests/

CMD [ "python", "app.py" ]

EXPOSE 8081
