#using easyPubMed in R

#devtools::install_github("dami82/easyPubMed")
  #note that earlier versions of easyPubMed install when I've used the general install("easyPubMed)
  #the following code will only run on the later (>3.0) versions
library(easyPubMed)

my_query <- readLines("bioTerms.txt")
my_query <- paste(my_query, collapse = "\t") 
my_query <- stringr::str_squish(my_query) #these two lines turn human-readable txt format into something to input into easyPubMed
my_query
epm <- epm_query(my_query)
epm <- epm_fetch(epm, format = 'medline', write_to_file = TRUE, outfile_prefix = "testPubMedDec11", store_contents = TRUE)
  #this is now a nice medline file that is human readable 
