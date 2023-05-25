import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

## @params: [JOB_NAME]
args = getResolvedOptions(sys.argv, ['JOB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

#le os dados do bucket
enem = (
    spark
    .read
    .format("csv")
    .option("header", True)
    .option("encoding", "ISO-8859-1")
    .option("inferSchema", True)
    .option("delimiter", ";")
    .load("s3://zancleo-edc/raw-data/")
)

#Converte em parquer e escreve no bucket

(
   enem
   .write
   .mode("overwrite")
   .partitionBy("NU_ANO")
   .format("parquet")
   .save("s3://zancleo-edc/consumer-zone/") 
)


job.commit()