FROM python:3.9

EXPOSE 5001
WORKDIR /app
ARG redis_url
ENV redis_url=$redis_url

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /tmp/requirements.txt
RUN mkdir -p /app
COPY ./api.py /app
COPY ./pyproject.toml /app

CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "5001"]
