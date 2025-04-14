# Using official Python image
FROM python:3.13-slim

# Creating a non-root user
RUN adduser --disabled-password --gecos "" user11

# Setting working directory
WORKDIR /app

# Copying requirement file and installing dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copying application code
COPY app.py .

# Changing ownership to non-root user
RUN chown -R user11:user11 /app

# Switching to non-root user
USER user11

# Exposing port
EXPOSE 5000

# Running the app
CMD ["python", "app.py"]