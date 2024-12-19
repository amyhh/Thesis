#using easyPubMed in R

library(easyPubMed)
library(stringr)

my_query <- readLines("MedicalStatisticsTermsImprovedMesh.txt")

## Do we need this for easyPubMed
my_query <- str_flatten(my_query)
my_query <- str_squish(my_query)

epm <- epm_query(my_query)
epm <- epm_fetch(epm, format = 'medline', write_to_file = TRUE, outfile_prefix = "MedicalStatisticsTermsImprovedMesh", store_contents = TRUE)
  #this is now a nice medline file that is human readable 
