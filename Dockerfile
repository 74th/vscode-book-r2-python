FROM python:3.11-slim
WORKDIR /app
RUN pip install poetry==1.3.2
COPY pyproject.toml poetry.lock ./
RUN poetry config virtualenvs.create false && poetry install

COPY api ./api

CMD ["poetry", "run", "python", "-m", "api"]