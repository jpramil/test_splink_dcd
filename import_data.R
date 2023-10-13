deces <- 
  aws.s3::s3read_using(
    FUN = arrow::read_parquet,
    object = "/appariements/deces.parquet",
    bucket = "projet-ssplab",
    opts = list("region" = "")
  )


s3/projet-ssplab/appariements
aws.s3::get_bucket("s3/projet-ssplab", region = "")
aws.s3::get_bucket("projet-ssplab")
arrow::read_parquet()