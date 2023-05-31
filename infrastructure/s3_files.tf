resource "aws_s3_bucket_object" "job_spark" {
  bucket = "datalake-lz-igti-producao"
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  acl    = "private"
  source = "../job_spark_glue.py"
  etag   = filemd5("../job_spark_glue.py")
}