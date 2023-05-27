resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.dl.id
  key    = "glue-code/pyspark/job_spark_glue.py"
  acl    = "private"
  source = "../job_spark_glue.py"
  etag   = filemd5("../job_spark_glue.py")
}