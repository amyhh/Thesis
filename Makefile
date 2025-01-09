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
pubmed.Rout: pubmed.R bioTerms.txt

Sources += $(wildcard *.md)

######################################################################

Ignore += $(wildcard *.combined.txt *_batch*.txt)

.PRECIOUS: %.search.Rout
%.search.Rout: search.R %.search
	$(pipeR)

## MedicalStatisticsTermsImprovedMesh_batch_01.txt: search.R
%_batch_01.txt: %.search.Rout ;

Sources += test.txt simple.txt
## simple.combined.txt: search.R simple.txt
## simple.search.Rout: search.R simple.txt
%.combined.txt: %_batch_01.txt
	cat $*_batch* > $@

## test.combined.txt: test.txt
## current.combined.txt: current.txt
## title.combined.txt: title.txt

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
