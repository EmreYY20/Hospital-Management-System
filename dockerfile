FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Update packages and install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

# Copy the Flask app files to the container
COPY . /app

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Expose the Flask app port
EXPOSE 5000

# Define the command to run the Flask app
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
