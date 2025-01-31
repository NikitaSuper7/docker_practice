FROM python:3.12-slim

WORKDIR /docker_practice

RUN apt-get update \
    && apt-get install -y gcc libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN pip install poetry && poetry --version

COPY pyproject.toml poetry.lock ./

RUN poetry install --no-root

RUN poetry show

RUN python -m django --version



COPY . .

ENV SECRET_KEY="django-insecure-ifnprns$7a_dqjp81k9d)ktl2o(l(h#c-(j_^e5^-xo&oy-5su"

# Создаем директорию для медиафайлов
RUN mkdir -p /app/media

# Пробрасываем порт, который будет использовать Django
EXPOSE 8000

# Команда для запуска приложения
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
