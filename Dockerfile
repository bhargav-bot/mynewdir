FROM python:latest
WORKDIR /app
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY cert.pem /etc/ssl/certs/cert.pem
COPY key.pem /etc/ssl/private/key.pem

COPY . .

EXPOSE 8008


CMD [ "uvicorn","python:app","--host","0.0.0.0","--port","8008","--ssl-certfile", "/etc/ssl/certs/cert.pem", "--ssl-keyfile", "/etc/ssl/private/key.pem","--reload"]




