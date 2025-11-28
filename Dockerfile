# Use a lightweight Python image
FROM python:3.11-slim

# Install system dependencies for Tesseract OCR
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        tesseract-ocr \
        libtesseract-dev \
        build-essential \
        wget \
        git && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory for the project
WORKDIR /app

# Copy everything into the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Move into the folder where FastAPI app.py is located
WORKDIR /app/Datathon

# Expose the port the app will run on
EXPOSE 8000

# Start the FastAPI app with Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
