#using easyPubMed in R
library(shellpipes)
## If you change the name of the text file, this should a) just work;
## b) write the output to a corresponding output file, making it easier to keep track of what goes with what
rpcall("simple.search.Rout simple.pipestar search.R simple.txt")

library(easyPubMed)
library(readr)

my_query <- read_file(matchFile(ext="search"))

epm <- epm_query(my_query)
epm <- epm_fetch(epm, format = 'medline', write_to_file = TRUE, outfile_prefix = pipeStar(), store_contents = TRUE)
