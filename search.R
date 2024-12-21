#using easyPubMed in R
library(shellpipes)

library(easyPubMed)
library(readr)

my_query <- read_file(matchFile(ext="txt"))

epm <- epm_query(my_query)
epm <- epm_fetch(epm, format = 'medline', write_to_file = TRUE, outfile_prefix = pipeStar(), store_contents = TRUE)
