# Dockerized Spark and Python Application Tutorial

In this tutorial, we'll guide you through the process of setting up a Dockerized environment for running a Python application with Apache Spark.

## Prerequisites

Before you begin, make sure you have the following installed on your system:

- [Docker Desktop](https://www.docker.com/products/docker-desktop)

## Step 1: Install Docker Desktop

Docker Desktop is a tool for building, shipping, and running applications in containers. Follow these steps to install Docker Desktop:

- Download Docker Desktop from the official website: [Docker Desktop](https://www.docker.com/products/docker-desktop)
- Install Docker Desktop by following the instructions for your operating system.

## Step 2: Create Your Project Directory

Create a directory for your Spark and Python application. Place your Python script (`main.py`) and Dockerfile in this directory.

## Step 3: Write the Dockerfile

Write a Dockerfile to define your Docker image. Here's a sample Dockerfile:

```Dockerfile
# Using openjdk as base image
FROM openjdk:11-slim

# Set the working directory
WORKDIR /app

# Install Python and other dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip

RUN apt-get update && apt-get install -y wget

# Copy your application files into the working directory
COPY . .

# Download Spark latest version
RUN wget -q https://archive.apache.org/dist/spark/spark-3.5.0/spark-3.5.0-bin-hadoop3.tgz && \
    tar -xzf spark-3.5.0-bin-hadoop3.tgz -C /app && \
    rm spark-3.5.0-bin-hadoop3.tgz

# Set environment variables
ENV SPARK_HOME /app/spark-3.5.0-bin-hadoop3
ENV PATH $PATH:$SPARK_HOME/bin
ENV PYSPARK_PYTHON python3

# Install PySpark
RUN pip3 install pyspark

# Run your Python script
CMD ["python3", "main.py"]
```

Save this file as `Dockerfile` in your project directory.

## Step 4: Build the Docker Image

Open a terminal, navigate to your project directory, and run the following command to build the Docker image:

```bash
docker build -t your-image-name .
```

Replace `your-image-name` with a name for your Docker image.

## Step 5: Run the Docker Container

Once the image is built, run a Docker container using the following command:

```bash
docker run -it your-image-name
```

This command starts the container and executes the `main.py` script in your application.

Congratulations! You've successfully set up a Dockerized environment for running a Python application with Apache Spark.

Feel free to customize the Dockerfile and Python script according to your application's requirements.
