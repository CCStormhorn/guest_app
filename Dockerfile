FROM python:3.8.18-slim-bookworm

WORKDIR /app

COPY app/app.py app.py
COPY app/models.py models.py
COPY app/templates templates
COPY requirements.txt requirements.txt

RUN pip install -r  requirements.txt

ENV FLASK_APP=/app/app.py
ENV DATABASE_URL=sqlite:///app/db.sqlite

EXPOSE 5000
CMD flask db init && flask db migrate -m "initialize migration" && flask db upgrade && flask run -h 0.0.0.0 --port 5000
