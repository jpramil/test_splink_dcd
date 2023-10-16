deces <- 
  aws.s3::s3read_using(
    FUN = arrow::read_parquet,
    object = "/appariements/deces.parquet",
    bucket = "projet-ssplab",
    opts = list("region" = "")
  )

library(data.table)
library(stringr)

setDT(deces)

variable_en_maj <- c("nom_etat_civil", "prenoms_etat_civil")
deces[, (variable_en_maj) :=lapply(.SD, str_to_lower), .SDcols = variable_en_maj]



deces_sample <- deces[1:1000,]


