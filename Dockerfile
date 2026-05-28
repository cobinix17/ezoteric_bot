FROM python:3.11-slim

WORKDIR /app

# Устанавливаем компиляторы и заголовки для сборки pyswisseph
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    make \
    swig \
    python3-dev \
    libc-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Копируем зависимости
COPY requirements.txt .

# Устанавливаем все зависимости (pyswisseph уже в requirements.txt)
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь код
COPY . .

# Запускаем бота (главный файл в корне)
CMD ["python", "main.py"]