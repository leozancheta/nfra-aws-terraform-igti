resource "aws_s3_bucket" "datalake" {
  #Parametros de config dos recursos escolhidos
  bucket = "${var.base_bucket_name} - ${var.environment}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}