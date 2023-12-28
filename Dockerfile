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
