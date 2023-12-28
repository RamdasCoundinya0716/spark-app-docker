from pyspark.sql import SparkSession

# Create a Spark session
spark = SparkSession.builder.appName("HelloSpark").getOrCreate()

# Create a DataFrame with a single column named "message" and a single row with the value "Hello, World!"
data = [("Hello, Spark!",)]
df = spark.createDataFrame(data, ["message"])

# Show the DataFrame
df.show()

# Stop the Spark session
spark.stop()
