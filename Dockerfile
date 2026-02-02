FROM python:3.12 AS builder

WORKDIR /install
COPY requirements.txt .
RUN pip install --prefix=/install -r requirements.txt

FROM python:3.12-slim

WORKDIR /app

COPY --from=builder /install /usr/local
COPY . .

EXPOSE 4010
CMD ["python", "app.py"]
