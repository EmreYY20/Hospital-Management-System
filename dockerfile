# Use an official Python runtime as the base image
FROM python:3.8-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Flask app code to the container
COPY . .

# Expose the port that the Flask app will run on
EXPOSE 5001

# Set the environment variables for the PostgreSQL connection
ENV POSTGRES_HOST=postgres-HMS
ENV POSTGRES_PORT=5432
ENV POSTGRES_DB=HMS
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=1234

# Run the Flask app
CMD ["python", "app.py"]
