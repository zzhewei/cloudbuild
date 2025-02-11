# Use official Python image as base
FROM python:3.10

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files
COPY . .

# Expose port 8080 (Cloud Run uses this port by default)
EXPOSE 8080

# Set the entrypoint
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8080"]
