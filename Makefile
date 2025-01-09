## This is Amy Hutchinson's thesis repo

current: target
-include target.mk
Ignore = target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

Sources += $(wildcard.R)
Ignore += testPub*

bioTerms_batch_01.txt: pubmed.Rout ;
pubmed.Rout: pubmed.R bioTerms.search

Sources += $(wildcard *.md)

######################################################################

Sources += $(wildcard *.search)

Ignore += $(wildcard *.combined.txt *_batch*.txt)

.PRECIOUS: %.search.Rout
%.search.Rout: search.R %.search
	$(pipeR)

## MedicalStatisticsTermsImprovedMesh_batch_01.txt: search.R
%_batch_01.txt: %.search.Rout ;

## simple.combined.txt: search.R simple.search
## simple.search.Rout: search.R simple.search
%.combined.txt: %_batch_01.txt
	cat $*_batch* > $@

## test.combined.txt: test.search
## current.combined.txt: current.search
## title.combined.txt: title.search

######################################################################

Sources += $(wildcard *.R)

autopipeR = defined

loebGraph.Rout: loebGraph.R

######################################################################

Sources += *.searchtext

## example.searchtext

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff

Makefile: makestuff/00.stamp
makestuff/%.stamp: | makestuff
	- $(RM) makestuff/*.stamp
	cd makestuff && $(MAKE) pull
	touch $@
makestuff:
	git clone --depth 1 $(msrepo)/makestuff

-include makestuff/os.mk

-include makestuff/pipeR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
