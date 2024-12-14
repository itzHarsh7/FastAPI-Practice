FROM python:3.11.5

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

# Install PostgreSQL client
RUN apt-get update && apt-get install -y postgresql-client

COPY requirements.txt /app/
RUN pip install -r requirements.txt

COPY . /app/
EXPOSE 9000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "9000", "--reload"]