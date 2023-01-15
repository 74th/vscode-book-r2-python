# Docker公式のPythonイメージを元にする
FROM python:3.11-slim

WORKDIR /app

# Pythonライブラリマネージャ Poetry のインストール
RUN pip install poetry==1.3.2

# 依存ライブラリのインストール
COPY pyproject.toml poetry.lock ./
RUN poetry config virtualenvs.create false && poetry install

# プログラムの格納
COPY domain ./domain
COPY memdb ./memdb
COPY server ./server

# Poetry 経由で
CMD ["poetry", "run", "flask", "--app=server.api", "--host=0.0.0.0", "--port=8000"]