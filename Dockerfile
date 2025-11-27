FROM python:3.12-slim-bookworm

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m -u 1000 botuser && chown -R botuser:botuser /usr/src/app
USER botuser

CMD [ "python", "./scripts/run_internship.py" ]