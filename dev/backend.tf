terraform {
  backend "s3" {
    bucket = "s3-backend-bucket-wops-hol"
    key    = "dev_state"
    region = "ap-southeast-2"
  }
}
