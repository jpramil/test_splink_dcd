aws.s3::s3write_using(
  x = deces_perturb,
  FUN = arrow::write_parquet,
  object = "/appariements/deces_perturb.parquet",
  bucket = "projet-ssplab",
  opts = list("region" = "")
)
